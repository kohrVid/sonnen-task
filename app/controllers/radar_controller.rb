class RadarController < ApplicationController
  def create
    radars = radar_params[:radar].map do |radar|
      position = radar[:position]
      targets = radar[:targets]

      Radar.new(
        position_attributes: position,
        targets_attributes: targets
      )
    end

    render json: {
      position: radars[0].position.as_json(only: [:x, :y]),
      targets: radars[0].targets.as_json(only: :target_type).flat_map(&:values)
    }
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
