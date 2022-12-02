import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react"
import store from "../store/store"

export const userApi = createApi({
	reducerPath: "userApi",
	baseQuery: fetchBaseQuery({
		baseUrl: "http://localhost:4001/",
		prepareHeaders: (headers) => {
			const token = store.getState().login?.token
			const role =
				store.getState().user?.user.user_is_admin === "true" ? "admin" : "none"

			console.log(role)
			if (token) {
				headers.set("x-access-token", token)
				headers.set("role", role)
				return headers
			}
			return headers
		},
	}),
	tagTypes: ["Users", "User"],
	endpoints: (builder) => ({
		register: builder.mutation({
			query: (payload) => ({
				url: "register",
				method: "POST",
				body: payload,
			}),
			invalidatesTags: ["Users"],
		}),
		getUser: builder.query({
			query: () => ({
				url: "user",
				method: "GET",
			}),
			providesTags: ["User"],
		}),
		getUsers: builder.mutation({
			query: (payload) => ({
				url: "users",
				method: "POST",
				body: payload,
			}),
			providesTags: ["Users"],
		}),
		updateUser: builder.mutation({
			query: (payload) => ({
				url: "users",
				method: "PUT",
				body: payload,
			}),
			invalidatesTags: ["User"],
		}),
		patchUser: builder.mutation({
			query: (payload) => ({
				url: "users",
				method: "PATCH",
				body: payload,
			}),
			invalidatesTags: ["Users"],
		}),
	}),
})

export const {
	useRegisterMutation,
	useGetUserQuery,
	useGetUsersMutation,
	useUpdateUserMutation,
	usePatchUserMutation,
} = userApi
export default userApi
