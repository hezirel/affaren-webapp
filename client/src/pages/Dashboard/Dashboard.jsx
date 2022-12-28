import { useGetUsersMutation } from "../../redux/services/userApi"
import { useSelector } from "react-redux"
import { useEffect } from "react"
import {
	Body,
	Container,
	Flex,
	SpaceHeader,
	SubTitle,
	Title,
} from "../../assets/styles/common.styles"
import DateInput from "../../components/DASHBOARD/DateInput/DateInput"
import ChartB from "../../components/DASHBOARD/Charts/ChartB/ChartB"
import ChartA from "../../components/DASHBOARD/Charts/ChartA/ChartA"

const Dashboard = () => {
	const user = useSelector((state) => state.user.user)
	const theme = useSelector((state) => state.theme.theme)
	const [getUsers, res] = useGetUsersMutation()

	useEffect(() => {
		getUsers({ user: user })
	}, [user])

	return (
		<Container theme={theme}>
			<SpaceHeader>
				<Title>Dashboard</Title>
				<Flex>
					<DateInput />
				</Flex>
			</SpaceHeader>
			<Body theme={theme}>
				<div>
					<SubTitle>Charts</SubTitle>
				</div>
				<Flex>
					<ChartA theme={theme} />
				</Flex>

				<div>
					<ChartB theme={theme} />

					<div></div>
				</div>
			</Body>
		</Container>
	)
}

export default Dashboard
