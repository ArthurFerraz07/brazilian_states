module BrazilianStates
  class State
    attr_reader :name, :uf

    def initialize(params={})
      @name = params[:name]
      @uf = params[:uf]
    end

    def get_name(initials)
      return nil if initials == nil || initials.empty?

      pretty_name(states[standardize(initials)])
    end

    def get_initials(_name)
      return nil if _name == nil || _name.empty?

      pretty_initials(states.invert[standardize(_name)])
    end

    # private

      def states
        {
          ac: :acre,
          al: :alagoas,
          ap: :amapá,
          am: :amazonas,
          ba: :bahia,
          ce: :ceará,
          cf: :distrito_federal,
          es: :espírito_santo,
          go: :goiás,
          ma: :maranhão,
          mt: :mato_grosso,
          ms: :mato_grosso_do_sul,
          mg: :minas_gerais,
          pa: :pará,
          pb: :paraíba,
          pr: :paraná,
          pe: :pernambuco,
          pi: :piauí,
          rj: :rio_de_janeiro,
          rn: :rio_grande_do_norte,
          rs: :rio_grande_do_sul,
          ro: :rondônia,
          rr: :roraima,
          sc: :santa_catarina,
          sp: :são_paulo,
          se: :sergipe,
          to: :tocantins
        }
      end

      def standardize(string='')
        return nil if string == nil || string.to_s.empty?

        string.to_s.strip.downcase.gsub(' ', '_').to_sym
      end

      def pretty_name(string='')
        return nil if string == nil || string.to_s.empty?

        standardize(string).to_s.split('_').map!(&:capitalize).join(' ')
      end

      def pretty_initials(string='')
        return nil if string == nil || string.to_s.empty?

        string.to_s.upcase
      end
  end
end