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

      def self.call(checker)
        loadavg = current_load
        checker.add_error(:excess_load) if loadavg > 8.0
        checker.add_message(:load, loadavg)
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
