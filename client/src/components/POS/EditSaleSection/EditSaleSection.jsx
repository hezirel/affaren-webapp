import Input from "../../common/Input/Input.component"
import Button from "../../common/Button/Button.component"
import { Wrapper } from "./EditSaleSection.styles"
import { useState } from "react"

const EditSaleSection = () => {
	const [saleNumber, setSaleNumber] = useState("")

	const handleChange = (e) => {
		setSaleNumber(e)
	}

	const handleEdit = () => {
		if (saleNumber !== "") {
		}
	}

	return (
		<Wrapper>
			<Input
				type="number"
				title="Sale N°"
				value={saleNumber}
				onChange={handleChange}
			/>
			<Button title="Edit" onClick={handleEdit} />
		</Wrapper>
	)
}

export default EditSaleSection
