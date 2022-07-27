require 'rails_helper'

RSpec.describe "Radars", type: :request do
  describe "POST /radar" do
    it "should return a radar object" do
      post '/radar', params: {
        "attack-mode": [
          "closest-first"
        ],
        "radar": [
          {
            "position": {
              "x": 0,
              "y":40
            },
            "targets": [
              {
                "type": "T1",
                "damage":30
              },
              {
                "type":"T-X",
                "damage":80
              },
              {
                "type": "Human"
              }
            ]
          },
          {
            "position": {
              "x":0,
              "y":60
            },
            "targets": [
              {
                "type": "T-X",
                "damage": 80
              }
            ]
          }
        ]
      }

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json).to eq({"position":{"x":0,"y":40},"targets":["T-X","T1"]})
    end

    context 'when the PrioritizeTX Attack Mode is used' do
      it "should return a radar object" do
        post '/radar', params: {
          "attack-mode": ["priorize-t-x"],
          "radar": [
            {
              "position": { "x": 0, "y": 20 },
              "targets": [
                { "type": "T7-T", "damage":30 },
                { "type": "HK-Bomber", "damage": 80 }
              ]
            },
            {
              "position": { "x": 0, "y": 80 },
              "targets": [
                { "type": "HK-Tank", "damage": 20 }
              ]
            },
            {
              "position": { "x": 0, "y": 90 },
              "targets": [
                { "type": "T-X", "damage": 20 },
                { "type": "T7-T", "damage": 30 },
                { "type": "HK-Bomber", "damage": 80 }
              ]
            }
          ]
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json).to eq(
          {"position":{"x":0,"y":90},"targets":["T-X","HK-Bomber","T7-T"]}
        )
      end
    end

    context 'when the AvoidCrossfire Attack Mode is used' do
      it "should return a radar object" do
        post '/radar', params: {
          "attack-mode": ["avoid-crossfire"],
          "radar": [
            {
              "position": { "x": 0, "y": 20 },
              "targets": [
                { "type": "T7-T", "damage": 30 },
                { "type": "HK-Bomber", "damage": 80 },
                { "type": "Human"}
              ]
            },
            {
              "position": { "x": 0, "y": 80 },
              "targets": [
                { "type": "HK-Tank", "damage": 20 }
              ]
            },
            {
              "position": { "x": 0, "y": 70 },
              "targets": [
                { "type": "T-X", "damage": 20 },
                { "type": "T7-T", "damage": 90 },
                { "type": "HK-Bomber", "damage": 80 }
              ]
            }
          ]
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json).to eq(
          {"position":{"x":0,"y":70},"targets":["T7-T","HK-Bomber","T-X"]}
        )
      end
    end

    context 'when radar only contains a single target' do
      it "should return a radar object" do
        post '/radar', params: {
          "attack-mode": ["furthest-first"],
          "radar": [
            {"position":{"x":70,"y":91},"targets":[{"type":"T-X","damage":20},{"type":"T7-T","damage":90}]},
            {"position":{"x":30,"y":95},"targets":{"type":"mech","number":20}},
          ]
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json).to eq(
          {"position":{"x":70,"y":91},"targets":["T7-T","T-X"]}
        )
      end
    end

    xcontext 'when Attack Modes are chained' do
      it "should return a radar object" do
        post '/radar', params: {
          "attack-mode": ["closest-first", "priorize-t-x"],
          "radar": [
            {
              "position": { "x": 0, "y": 20 },
              "targets": [
                { "type": "T7-T", "damage":30 },
                { "type": "HK-Bomber", "damage": 80 }
              ]
            },
            {
              "position": { "x": 0, "y": 80 },
              "targets": [
                { "type": "HK-Tank", "damage": 20 }
              ]
            },
            {
              "position": { "x": 0, "y": 90 },
              "targets": [
                { "type": "T-X", "damage": 20 },
                { "type": "T7-T", "damage": 30 },
                { "type": "HK-Bomber", "damage": 80 }
              ]
            }
          ]
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(json).to eq(
         {"position":{"x":0,"y":20},"targets":["T-X","HK-Bomber"]}
        )
      end
    end
  end
end
