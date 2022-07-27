require "./lib/attack_mode.rb"

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

    attacked_radar = AttackMode.call(radar_params[:attack_mode], radars)
    target_order = AttackMode.target_order(radar_params[:attack_mode][0])

    render json: attacked_radar.as_json({
      target_order: target_order
    })
  end

  def radar_params
    params.deep_transform_keys(&:underscore).permit(
      attack_mode: [],
      radar: [
        position: [:x, :y],
        targets: [:type, :damage]
      ]
    )
  end
end
