
import { useSelector } from "react-redux"

import Input from "../../components/Input/Input.component"
import Button from "../../components/Button/Button.component"
import { Grid } from "@mui/material"
import { Body, Container, Flex, Header, SearchSection, SubTitle, Title } from "../../assets/styles/common.styles"

const Inventory = () => {
	const theme = useSelector((state) => state.theme.theme)

	return (
		<Grid item>
			<Header>
				<Title>Inventory</Title>
			</Header>
			<SearchSection>
				<Flex>
					<Input theme={theme} />
					<Button color="purple" title="Search" />
				</Flex>
				<Flex>
					<Input theme={theme} />
					<Button color="purple" title="Search" />
				</Flex>
			</SearchSection>
			<Body theme={theme}>
				<div>
					<SubTitle>Products</SubTitle>
				</div>
				<div></div>

				<div>
					<div></div>
					<div></div>
				</div>
			</Body>
		</Grid>
	)
}

export default Inventory
