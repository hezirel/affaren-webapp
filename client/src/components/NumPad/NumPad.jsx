import { useState } from "react"
import { ArtTitle } from "../../assets/styles/common.styles"
import { CorrectBtn, Display, Keypad, Num, NumRow } from "./NumPad.styles"
import BackspaceOutlinedIcon from "@mui/icons-material/BackspaceOutlined"

const NumPad = () => {
	const [value, setValue] = useState("")

    const handleClick = e => {
        setValue(value + e.target.dataset.value)
    }

    const handleCorrect = () => {
        setValue(value.slice(0,-1))
    }
	return (
		<div className="numpad">
			<Display className="display">
				<ArtTitle>{value} €</ArtTitle>
                <CorrectBtn onClick={handleCorrect}><BackspaceOutlinedIcon /></CorrectBtn>
			</Display>
			<Keypad>
				<NumRow>
					<Num className="num" data-value={1} onClick={handleClick}>
						1
					</Num>
					<Num className="num" data-value={2} onClick={handleClick}>
						2
					</Num>
					<Num className="num" data-value={3} onClick={handleClick}>
						3
					</Num>
				</NumRow>
				<NumRow className="num-row">
					<Num className="num" data-value={4} onClick={handleClick}>
						4
					</Num>
					<Num className="num" data-value={5} onClick={handleClick}>
						5
					</Num>
					<Num className="num" data-value={6} onClick={handleClick}>
						6
					</Num>
				</NumRow>
				<NumRow className="num-row">
					<Num className="num" data-value={7} onClick={handleClick}>
						7
					</Num>
					<Num className="num" data-value={8} onClick={handleClick}>
						8
					</Num>
					<Num className="num" data-value={9} onClick={handleClick}>
						9
					</Num>
				</NumRow>
				<NumRow className="num-row">
					<Num className="num" data-value="" onClick={handleClick}>
						
					</Num>
					<Num className="num" data-value={0} onClick={handleClick}>
						0
					</Num>
					<Num className="num" data-value="," onClick={handleClick}>
						.
					</Num>
				</NumRow>
			</Keypad>
		</div>
	)
}

export default NumPad