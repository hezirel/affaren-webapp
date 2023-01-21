import styled from "styled-components"
import { constant } from "../../../assets/common/common.styles"
import dark from "../../../assets/common/dark.theme.styles"
import light from "../../../assets/common/light.theme.styles"

export const Container = styled.div`
	position: relative;
	display: flex;
	flex-direction: column;
	flex: 1;
	padding: ${constant.PADDING_L}px;
	height: 100%;
	width: 100%;
	overflow: scroll;
	gap: ${constant.GAP * 2}px;
	color: ${(props) =>
		props.theme === "dark" ? dark.COLOR_TEXT : light.COLOR_TEXT};
	background-color: ${(props) =>
		props.theme === "dark" ? dark.COLOR_BG_PRIMARY : light.COLOR_BG_PRIMARY};

	@media (max-width: 768px) {
		padding: ${constant.PADDING_M}px;
		padding-block: ${constant.PADDING_M * 3}px;
		gap: ${constant.GAP}px;
	}
`

export const AsideContainer = styled.main`
	position: relative;
	display: flex;
	flex-direction: column;

	padding: ${constant.PADDING_L}px;
	height: 100%;
	width: 35%;
	overflow: scroll;
	gap: ${constant.GAP * 2}px;
	color: ${(props) =>
		props.theme === "dark" ? dark.COLOR_TEXT : light.COLOR_TEXT};
	background-color: ${(props) =>
		props.theme === "dark" ? dark.COLOR_BG_PRIMARY : light.COLOR_BG_PRIMARY};
	@media (max-width: 768px) {
		position: absolute;
		width: 100%;
		padding: ${constant.PADDING_M}px;
		padding-block: ${constant.PADDING_M * 3}px;
		gap: ${constant.GAP}px;
	}
`

export const ButtonWrapper = styled.div`
	display: none !important;
	position: fixed;
	top: 0;
	right: 0;
	z-index: 10;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: ${constant.PADDING_S}px;
	@media (max-width: 768px) {
		display: block !important;
	}
`
