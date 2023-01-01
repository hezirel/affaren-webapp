import AddProductCard from "../AddProductCard/AddProductCard"
import ProductCard from "../ProductCard/ProductCard"
import { StyledProductCardSection } from "./ProductCardSection.styles"
import { useSelector } from "react-redux"

const ProductCardSection = ({ theme, onClick }) => {
	const cards = useSelector((state) => state.cards.cards)


	return (
		<StyledProductCardSection theme={theme} id="card-section">
			{/* dynamically create boxes based on cards */}
			{cards &&
				cards.map((card) => (
					<ProductCard
						key={card.card_id}
						theme={theme}
						id={card.card_id}
						name={card.card_name}
						price={card.card_price}
						taxe={card.card_taxe}
					/>
				))}
			<AddProductCard onClick={onClick} />
		</StyledProductCardSection>
	)
}

export default ProductCardSection
