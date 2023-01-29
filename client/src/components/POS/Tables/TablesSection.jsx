import { useSelector } from "react-redux"
import {
	useGetActiveTablesQuery,
	usePostTableMutation,
} from "../../../redux/services/tablesApi"
import { Backdrop, SpeedDial, SpeedDialAction } from "@mui/material"
import AddOutlinedIcon from "@mui/icons-material/AddOutlined"
import TableRestaurantOutlinedIcon from "@mui/icons-material/TableRestaurantOutlined"
import { useState } from "react"
import { BigScreen, SmallScreen } from "./TableSection.styles"
import { CardTitle, StyledProductCard } from "../ProductCard/ProductCard.styles"
import AddIcon from "@mui/icons-material/Add"
import InfoMessage from "../../common/InfoMessage/InfoMessage"

const TablesSection = ({ theme, onClick }) => {
	useGetActiveTablesQuery()
	const activeTables = useSelector((state) => state.table.activeTables)
	const [postTable, res] = usePostTableMutation()
	const [open, setOpen] = useState(false)
	const handleOpen = () => setOpen(true)
	const handleClose = () => setOpen(false)

	const handleAddTable = () => {
		const timestamp = new Date()

		const day = timestamp.getDate()
		const month = timestamp.getMonth() + 1
		const year = timestamp.getFullYear()

		const tableNumber =
			activeTables?.length === 0 ? 1 : activeTables?.length + 1

		const table = {
			year: year,
			month: month,
			day: day,
			status: "active",
			number: tableNumber,
		}
		postTable(table)
	}

	return (
		<>
			{res.isError && (
				<InfoMessage state="error" text="Failed to create table" />
			)}
			<SmallScreen>
				<StyledProductCard onClick={handleAddTable}>
					<AddIcon />
				</StyledProductCard>
				{activeTables?.map((table) => (
					<StyledProductCard
						key={table.table_id}
						data-id={table.table_id}
						onClick={onClick}
					>
						<CardTitle data-id={table.table_id}>{table.table_number}</CardTitle>
					</StyledProductCard>
				))}
			</SmallScreen>
			<BigScreen>
				<Backdrop open={open} sx={{ zIndex: 2 }} />
				<SpeedDial
					ariaLabel="SpeedDial basic example"
					sx={{ position: "absolute", top: 48, right: 48, zIndex: 3 }}
					icon={<TableRestaurantOutlinedIcon />}
					onClose={handleClose}
					onOpen={handleOpen}
					direction="down"
				>
					{activeTables &&
						activeTables.map((card, i) => (
							<SpeedDialAction
								key={card.table_id}
								icon={<TableRestaurantOutlinedIcon />}
								data-id={card.table_id}
								onClick={onClick}
								tooltipTitle={card.table_number}
								tooltipOpen
							/>
						))}
					<SpeedDialAction
						icon={<AddOutlinedIcon />}
						onClick={handleAddTable}
						tooltipTitle="Add Table"
					/>
				</SpeedDial>
			</BigScreen>
		</>
	)
}

export default TablesSection
