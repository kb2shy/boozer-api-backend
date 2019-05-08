module Api
  module V1
    class IngredientsController < ApplicationController

      def index
        render json: Ingredient.all
      end

      def create
        ingredient = Ingredient.new(ingredient_params)

        if ingredient.save
          render json: ingredient, status: :accepted
        else
          render json: {errors: ingredient.errors.full_messages}, status: :unprocessible_entity
        end
      end

      private

      def ingredient_params
        params.permit(:name)
      end
    end
  end
end
