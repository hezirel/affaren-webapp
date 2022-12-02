import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react"
import store from "../store/store"

export const api = createApi({
	reducerPath: "loginApi",
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
	tagTypes: ["Sales"],
	endpoints: (builder) => ({
		getAuth: builder.mutation({
			query: (payload) => ({
				url: "login",
				method: "POST",
				body: payload,
			}),
		}),
		// sales
		postSale: builder.mutation({
			query: ({ payload }) => ({
				url: "sales",
				method: "POST",
				body: payload,
			}),
			invalidatesTags: ["Sales"],
		}),
		updateSale: builder.mutation({
			query: ({ id, payload }) => ({
				url: `sales/${id}`,
				method: "PUT",
				body: payload,
			}),
			invalidatesTags: ["Sales"],
		}),
		getSales: builder.query({
			query: () => ({
				url: "sales",
			}),
			providesTags: ["Sales"],
		}),
		getSale: builder.query({
			query: ({ id }) => ({
				url: `sales/${id}`,
			}),
		}),
		deleteSale: builder.mutation({
			query: ({ id }) => ({
				url: `sales/${id}`,
				method: "DELETE",
			}),
			invalidatesTags: ["Sales"],
		}),
		// sales_products
		postSaleProducts: builder.mutation({
			query: ({ id, payload }) => ({
				url: `sales/${id}/products`,
				method: "POST",
				body: payload,
			}),
		}),
		getSalesProducts: builder.query({
			query: ({ id }) => ({
				url: `sales/${id}/products`,
			}),
		}),
		deleteSaleProducts: builder.mutation({
			query: ({ id }) => ({
				url: `sales/${id}/products`,
				method: "DELETE",
			}),
		}),
	}),
})

export const {
	useRegisterMutation,
	useGetAuthMutation,
	useGetUserQuery,
	useGetUsersMutation,
	useUpdateUserMutation,
	usePatchUserMutation,
} = api
export default api
