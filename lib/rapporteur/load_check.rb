require "ffi"
require "rapporteur"

module Rapporteur
  module Checks
    class LoadCheck
      extend FFI::Library

      ffi_lib FFI::Library::LIBC

      attach_function :getloadavg,  [:pointer, :int], :int
      attach_function :strerror,    [:int],           :string

      private_class_method :getloadavg, :strerror

      DEFAULT_TOLERANCE = 8.0

      def initialize(tolerance=DEFAULT_TOLERANCE)
        @tolerance = tolerance
      end

      def call(checker)
        loadavg = self.class.current_load
        checker.add_error(:excess_load) if loadavg > @tolerance
        checker.add_message(:load, loadavg)
      end

      def self.call(checker)
        new.call(checker)
      end

      def self.current_load
        loadavg = FFI::MemoryPointer.new(:double, 1)
        if getloadavg(loadavg, 1) == -1
          raise SystemCallError, "getloadavg() - #{strerror(FFI.errno)}"
        end
        loadavg.read_double
      end
    end
  end
end
