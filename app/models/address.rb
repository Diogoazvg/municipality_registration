# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :municipality_resident

  validates :zip_code, :address1, :neighborhood, :city, :uf, presence: true

  enum uf: {
    'AC, Acre': 0,
    'AL, Alagoas': 1,
    'AP, Amapá': 2,
    'AM, Amazonas': 3,
    'BA, Bahia': 4,
    'CE, Ceará': 5,
    'DF, Distrito Federal': 6,
    'ES, Espirito Santo': 7,
    'GO, Goiás': 8,
    'MA, Maranhão': 9,
    'MS, Mato Grosso do Sul': 10,
    'MT, Mato Grosso': 11,
    'MG, Minas Gerais': 12,
    'PA, Pará': 13,
    'PB, Paraíba': 14,
    'PR, Paraná': 15,
    'PE, Pernambuco': 16,
    'PI, Piauí': 17,
    'RJ, Rio de Janeiro': 18,
    'RN, Rio Grande do Norte': 19,
    'RS, Rio Grande do Sul': 20,
    'RO, Rondônia': 21,
    'RR, Roraima': 22,
    'SC, Santa Catarina': 23,
    'SP, São Paulo': 24,
    'SE, Sergipe': 25,
    'TO, Tocantins': 26
  }, _prefix: :currently_uf

  enum ibge_code: {
    'empty': nil,
    '12': 0,
    '27': 1,
    '16': 2,
    '13': 3,
    '29': 4,
    '23': 5,
    '53': 6,
    '32': 7,
    '52': 8,
    '21': 9,
    '51': 10,
    '50': 11,
    '31': 12,
    '15': 13,
    '25': 14,
    '41': 15,
    '26': 16,
    '22': 17,
    '24': 18,
    '43': 19,
    '33': 20,
    '11': 21,
    '14': 22,
    '42': 23,
    '35': 24,
    '28': 25,
    '17': 26
  }, _prefix: :currently_ibge
end
