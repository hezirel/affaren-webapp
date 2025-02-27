import { useSelector } from "react-redux"
import Input from "../../components/common/Input/Input.component"
import Button from "../../components/common/Button/Button.component"
import {
	Container,
	FitContainer,
	Flex,
	SearchSection,
	SpaceHeader,
	SubTitle,
	Title,
} from "../../assets/common/common.styles"
import InventoryTable from "../../components/INVENTORY/InventoryTable/InventoryTable"
import { useState } from "react"
import { useGetProductsQuery } from "../../redux/services/productsApi"
import { useEffect } from "react"
import BarcodeInput from "../../components/common/BarcodeInput/BarcodeInput"
import EditProduct from "../../components/INVENTORY/EditProduct/EditProduct"
import CreateProduct from "../../components/INVENTORY/CreateProduct/CreateProduct"
import { useNavigate } from "react-router-dom"
import InfoMessage from "../../components/common/InfoMessage/InfoMessage"

const Inventory = () => {
	const loggedIn = useSelector((state) => state.login.loggedIn)
	const navigate = useNavigate()
	const theme = useSelector((state) => state.theme.theme)
	const [searchString, setSearchString] = useState("")
	const [barcode, setBarcode] = useState("")
	const [inputBarcode, setInputBarcode] = useState("")
	const [barcodeSearch, setBarcodeSearch] = useState(false)
	const [filteredProducts, setFilteredProducts] = useState([])
	const [editingProduct, setEditingProduct] = useState({})
	const [isEditMode, setIsEditMode] = useState(false)
	const [isCreationMode, setIsCreationMode] = useState(false)
	const [isProductFound, setIsProductFound] = useState(false)
	const [sent, setSent] = useState(false)

	const { data, isError } = useGetProductsQuery()

	const redirect = () => {
		!loggedIn && navigate("/login")
	}

	const toggleEditMode = () => {
		setIsEditMode(!isEditMode)
	}

	const toggleCreationMode = () => {
		setIsCreationMode(!isCreationMode)
	}

	const cancelEditingMode = () => {
		setIsEditMode(false)
	}

	const filterProducts = ({ data, searchString }) => {
		// if empty string, return data
		if (!searchString) {
			setFilteredProducts(data)
			// else, look for string matches
		} else {
			let array = data?.filter((item) =>
				item.product_name.toLowerCase().includes(searchString.toLowerCase())
			)
			setFilteredProducts(array)
		}
	}

	// when clickin on table row, open editor
	const openEditor = (product) => {
		setIsEditMode(true)
		setIsProductFound(true)
		setEditingProduct(product)
		setIsCreationMode(false)
	}

	// focus automatically on barcode input
	const focusOnBarcode = () => {
		const input = document.getElementById("barcode-input")
		input.focus()
	}

	// find product with barcode
	const findBarcode = ({ nosuffix, barcode }) => {
		// reset found values
		setIsProductFound(false)
		setSent(false)
		// search for match
		let found
		if (nosuffix) {
			found = data?.filter((item) => item.product_barcode === barcode)
		} else {
			found = data?.filter(
				(item) => item.product_barcode === barcode.slice(0, -2)
			)
		}
		// set barcode search to update button (search or reset ?)
		setBarcodeSearch(true)
		// if found, close creation mode, set product found, open editor
		if (found.length > 0) {
			setIsCreationMode(false)
			setIsProductFound(true)
			setFilteredProducts(found)
			setEditingProduct(found[0])
			// if in edit mode, reset barcode to speed workflow
			if (isEditMode) {
				setBarcode("")
				setBarcodeSearch(false)
			}
			// if not found, open creation mode
		} else {
			setIsProductFound(false)
			setIsCreationMode(true)
			setInputBarcode(barcode)
			setBarcode("")
			setBarcodeSearch(false)
		}
	}

	const resetBarcode = () => {
		// setIsProductFound(false)
		setBarcode("")
		setEditingProduct({})
		setBarcodeSearch(false)
		filterProducts({ data: data })
		focusOnBarcode()
	}

	const softResetBarcode = () => {
		setBarcode("")
		// setEditingProduct({})
		setBarcodeSearch(false)
		// filterProducts({ data: data })
		focusOnBarcode()
	}

	useEffect(() => {
		filterProducts({ data, searchString })
	}, [data, searchString])

	useEffect(() => {
		if (barcode.endsWith("/n")) {
			findBarcode({ barcode })
		}
	}, [barcode])

	useEffect(() => {
		redirect()
	}, [])

	return (
		<Container theme={theme}>
			<SpaceHeader>
				<Title>Inventory</Title>
				<Button
					title="Edit Mode"
					variant={isEditMode ? "contained" : "outlined"}
					color={isEditMode ? "success" : "error"}
					onClick={toggleEditMode}
				/>
			</SpaceHeader>
			<SearchSection>
				<Flex>
					<BarcodeInput
						barcode={barcode}
						setBarcode={setBarcode}
						setFilteredProducts={setFilteredProducts}
					/>
					<Button
						title={barcodeSearch ? "Reset" : "Search"}
						onClick={
							barcodeSearch
								? () => resetBarcode()
								: () => findBarcode({ nosuffix: true, barcode })
						}
					/>
				</Flex>
				<Flex>
					<Input label="Name" value={searchString} onChange={setSearchString} />
				</Flex>
			</SearchSection>
			<FitContainer theme={theme}>
				<SpaceHeader>
					<SubTitle>{isEditMode ? "Edit Mode" : "Products"}</SubTitle>

					{isEditMode ? (
						<Button title="Cancel" onClick={cancelEditingMode} />
					) : (
						<Button
							title={isCreationMode ? "Cancel" : "Create a Product"}
							onClick={toggleCreationMode}
						/>
					)}
				</SpaceHeader>
				<div>
					{isProductFound && isEditMode ? (
						<EditProduct
							product={editingProduct}
							focusOnBarcode={focusOnBarcode}
							resetBarcode={softResetBarcode}
							setIsProductFound={setIsProductFound}
							setSent={setSent}
							sent={sent}
						/>
					) : isCreationMode ? (
						<CreateProduct
							inputBarcode={inputBarcode}
							focusOnBarcode={focusOnBarcode}
							resetBarcode={resetBarcode}
							sent={sent}
							setSent={setSent}
						/>
					) : isError ? (
						<InfoMessage state="error" text="Failed to fetch products" />
					) : (
						<InventoryTable
							products={filteredProducts}
							openEditor={openEditor}
						/>
					)}
				</div>
			</FitContainer>
		</Container>
	)
}

export default Inventory
