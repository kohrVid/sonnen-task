class RadarController < ApplicationController
  def create
    radars = radar_params[:radar].map do |radar|
      position = radar[:position]
      targets = radar[:targets]

      Radar.create(
        position_attributes: position,
        targets_attributes: targets
      )
    end

    attacked_radar = radars[0]

    render json: attacked_radar.as_json
  end

  def radar_params
    params.permit(
      :attack_mode,
      radar: [
        position: [:x, :y],
        targets: [:type, :damage]
      ]
    )
  end
end
