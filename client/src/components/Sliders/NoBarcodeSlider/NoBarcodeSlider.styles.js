import styled from "styled-components"
import dark from "../../../assets/styles/dark.theme.styles"
import light from "../../../assets/styles/light.theme.styles"
import { constant } from "../../../assets/styles/common.styles"

export const FormWrapper = styled.div`
	display: flex;
	flex-direction: column;
	gap: 2rem;
`

export const DialogCard = styled.div`
    padding: ${constant.PADDING_M}px;
	box-shadow: 10px 10px 15px 0px rgba(0, 0, 0, 0.3);
	background-color: ${(props) =>
		props.theme === "dark"
			? dark.COLOR_BG_SECONDARY
			: light.COLOR_BG_SECONDARY};
`