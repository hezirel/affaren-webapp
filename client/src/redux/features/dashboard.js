import { createSlice } from "@reduxjs/toolkit"

const initialState = {
	date: "",
	dayArray: [],
	fullArray: [],
}

const dashboardSlice = createSlice({
	name: "dashboard",
	initialState,
	reducers: {
		setDate: (state, action) => {
			state.date = action.payload.date
		},
		setDayArray: (state, action) => {
			state.dayArray = action.payload.dayArray
		},
		setFullArray: (state, action) => {
			state.fullArray = action.payload.fullArray
		},
	},
})

export const { setDate, setDayArray, setFullArray } = dashboardSlice.actions
export default dashboardSlice.reducer