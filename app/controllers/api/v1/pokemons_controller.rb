module Api
	module V1
		class PokemonsController < ApplicationController
			protect_from_forgery			

			#http://localhost:3000/api/v1/pokemons?page=2&per_page=2
			def index
				if params.has_key?(:page)
					@pokemons = Pokemon.page(page).per(per_page);
					set_pagination_headers;
					render json: {
						status: 'SUCCESS', 
						message: "Total items: #{@pokemons.total_count}, Page: #{page} of #{Integer(@pokemons.total_count) / Integer(page)}",
						data:@pokemons
					},	status: :ok
				else
					@pokemons = Pokemon.order('name DESC');
					render json: {
						status: 'SUCCESS', 						
						message: "total: #{@pokemons.total_count}",
						data:@pokemons
					},	status: :ok
				end
			end
			  

			def show
				pokemon = Pokemon.find(params[:id]);
				render json: {
					status: 'SUCCESS', 
					message: "pokemon whith id #{params[:id]} has been loaded",
					data:pokemon
				},	status: :ok
			end
			
			def create
				pokemon = Pokemon.new(pokemon_args)

				if pokemon.save
					render json: {
						status: 'SUCCESS', 
						message: "pokemon has been saved",
						data:pokemon
					},	status: :ok
				else
					render json: {
						status: 'ERROR', 
						message: "pokemon not saved",
						data:pokemon
					},	status: :unprocessable_entity
				end
			end

			def destroy
				pokemon = Pokemon.find(params[:id]);
				pokemon.destroy
				render json: {
						status: 'SUCCESS', 
						message: "pokemon whith id #{params[:id]} has been deleted",
						data:pokemon
					},	status: :ok
			end

			def update
				pokemon = Pokemon.find(params[:id]);
				if pokemon.update(pokemon_args)
					render json: {
						status: 'SUCCESS', 
						message: "pokemon whith id #{params[:id]} has been updated",
						data:pokemon
					},	status: :ok
				else
					render json: {
						status: 'ERROR', 
						message: "pokemon not updated",
						data:pokemon
					},	status: :unprocessable_entity
				end
			end

			private
			
			def pokemon_args
				params.permit(
					:name,
					:type_1,
					:type_2,
					:total,
					:hp,
					:attack,
					:defense,
					:sp_atk,
					:sp_def,
					:speed,
					:generation,
					:legendary
				)
			end

			def page
				page ||= params[:page] || 1
			end

			def per_page
				per_page ||= params[:per_page] || 10
			end

			def set_pagination_headers
				headers["X-Total-Count"] = @pokemons.total_count
			end

		end
	end
end