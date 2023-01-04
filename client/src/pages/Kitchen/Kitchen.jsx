import { IconButton } from "@mui/material"
import { useEffect } from "react"
import { useState } from "react"
import { useSelector } from "react-redux"
import {
	ArtTitle,
	Body,
	ColumnCenter,
	Container,
	Flex,
	FullCenter,
	SubTitle,
	Title,
	VerticalCenter,
} from "../../assets/styles/common.styles"
import Button from "../../components/common/Button/Button.component"
import BarcodeInput from "../../components/INVENTORY/BarcodeInput/BarcodeInput"
import {
	useGetProductQuery,
	useUpdateProductsMutation,
} from "../../redux/services/productsApi"
import AddIcon from "@mui/icons-material/Add"
import RemoveIcon from "@mui/icons-material/Remove"
import { ServerStyleSheet } from "styled-components"

const Kitchen = () => {
	const theme = useSelector((state) => state.theme.theme)
	const [barcode, setBarcode] = useState("")
	const [skip, setSkip] = useState(true)
	const [home, setHome] = useState(true)
	const [quantity, setQuantity] = useState(0)
	const [updateProduct, res] = useUpdateProductsMutation()
	const { data, isError, isSuccess } = useGetProductQuery(
		{ barcode: barcode.endsWith("/n") ? barcode.slice(0, -2) : barcode },
		{ skip }
	)

	const handleApply = () => {
		setSkip(true)
		updateProduct({ quantity: quantity, id: data?.product_id })
	}

	const handleSearch = () => {
		setSkip(false)
		setHome(false)
	}

	const handleQuantityChange = (num) => {
		setQuantity(quantity + num)
	}

	const reset = () => {
		setSkip(true)
		setBarcode("")
		setHome(true)
		setQuantity(0)
		document.getElementById("inventory-barcode-input").focus()
	}

	useEffect(() => {
		barcode.endsWith("/n") && handleSearch()
	}, [barcode])

	return (
		<Container theme={theme}>
			<Title>Kitchen</Title>
			<Flex>
				<BarcodeInput barcode={barcode} setBarcode={setBarcode} />
				<Button title="Search" onClick={handleSearch} />
				<Button title="Reset" color="warning" onClick={reset} />
			</Flex>
			{!home && isSuccess ? (
				<Body>
					<SubTitle>{data?.product_name}</SubTitle>
					<FullCenter>
						<ColumnCenter>
							<ArtTitle>Current Stock</ArtTitle>
							<VerticalCenter>
								<Title>{data?.product_quantity - quantity}</Title>
							</VerticalCenter>
							<ArtTitle>How much do you want to take ?</ArtTitle>
							<VerticalCenter>
								<IconButton onClick={() => handleQuantityChange(-1)}>
									<RemoveIcon sx={{ fontSize: "64px" }} />
								</IconButton>
								<Title>{quantity}</Title>
								<IconButton onClick={() => handleQuantityChange(1)}>
									<AddIcon sx={{ fontSize: "64px" }} />
								</IconButton>
							</VerticalCenter>
						</ColumnCenter>
					</FullCenter>
					<Button
						title="Apply"
						color="success"
						disabled={quantity === 0}
						onClick={handleApply}
					/>
				</Body>
			) : !home && isError ? (
				<Body>
					<FullCenter>
						<SubTitle>Product Not Found</SubTitle>
					</FullCenter>
				</Body>
			) : (
				!home &&
				res.isSuccess && (
					<Body>
						<FullCenter>
							<ColumnCenter>
								<Title>Product Stock Updated</Title>
								<SubTitle>You took {quantity}</SubTitle>
								<Button title="Reset" color="warning" onClick={reset} />
							</ColumnCenter>
						</FullCenter>
					</Body>
				)
			)}
		</Container>
	)
}

export default Kitchen