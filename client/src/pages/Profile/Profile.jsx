import { useSelector } from "react-redux"
import {
	Body,
	Container,
	ErrorMessage,
	Header,
	SubTitle,
	Title,
} from "../../assets/styles/common.styles"
import {
	useGetUserQuery,
	useGetUsersMutation,
} from "../../redux/services/userApi"
import UserProfile from "../../components/PROFILE/UserProfile/UserProfile"
import AdminProfile from "../../components/PROFILE/AdminProfile/AdminProfile"
import { useEffect } from "react"
import { useNavigate } from "react-router-dom"

const Profile = () => {
	useGetUserQuery()
	const loggedIn = useSelector((state) => state.login.loggedIn)
	const theme = useSelector((state) => state.theme.theme)
	const user = useSelector((state) => state.user.user)
	const users = useSelector((state) => state.user.users)
	const [getUsers, res] = useGetUsersMutation()
	const navigate = useNavigate()

	const redirect = () => {
		!loggedIn && navigate("/login")
	}

	useEffect(() => {
		Object.keys(user).length && user?.user_is_admin === "true" && getUsers({ user: user })
	}, [user])

	useEffect(() => {
		redirect()
	}, [])

	return (
		<Container theme={theme}>
			<Header>
				<Title>
					{user && user.user_first_name} {user && user.user_last_name}
				</Title>
			</Header>
			<Body theme={theme}>
				<UserProfile user={user} />
			</Body>
			{res.isError && <ErrorMessage>Failed to get users</ErrorMessage>}
			{user?.user_is_admin === "true" && (
				<Body theme={theme}>
					<AdminProfile users={users} />
				</Body>
			)}
		</Container>
	)
}

export default Profile
