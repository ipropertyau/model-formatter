require 'rubygems'
require 'action_view'

module Formatters
  class FormatCurrency < Format
    include ActionView::Helpers::NumberHelper

    def initialize(options = {})
      @precision = options[:precision] || 2
    end

    def from(value, options = {})
      options = {:precision => @precision}.merge(options)
      number_to_currency(value.to_d, options)
    end

    def to(str, options = {})
      return nil if str.nil? or str.empty?
      str.gsub(/[^0-9.\-]/, '').to_d
    end
  end
end
