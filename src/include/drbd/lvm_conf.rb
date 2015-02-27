# encoding: utf-8

module Yast
  module DrbdLvmConfInclude
    def initialize_drbd_lvm_conf(include_target)
      textdomain "drbd"

      Yast.import "UI"
      Yast.import "Label"
      Yast.import "Wizard"
      Yast.import "Drbd"

      Yast.include include_target, "drbd/helps.rb"
      Yast.include include_target, "drbd/common.rb"

      @filter = ""
      @nocache = "true"
    end

    def lvm_conf_Read
      @filter = Ops.get_string( Drbd.lvm_config, "filter", "" )
      cache = Ops.get_string( Drbd.lvm_config, "write_cache_state", "0" )

      if cache == "0"
        @nocache = "true"
      else
        @nocache = "false"
      end

      nil
    end

    def lvm_conf_GetDialog
      VBox(
        Frame(
          _("LVM Configuration of DRBD"),
          HBox(
            VBox(
              Left(
                InputField(
                  Id("Filter"),
                  Opt(:hstretch),
                  _("Device Filter"),
                  @filter
                )
              ),
              VSpacing(1),
              Left(
                CheckBox(
                  Id("LVMCache"),
                  Opt(:notify),
                  _("Disable LVM Cache"),
                  @nocache == "true"
                )
              )
            )
          )
        ),
        VStretch()
      )
    end

    def lvm_conf_Write
      @filter = UI.QueryWidget(Id("Filter"), :Value).to_s

      @nocache = UI.QueryWidget(Id("LVMCache"), :Value)

      if @nocache
        cache = "0"
      else
        cache = "1"
      end

      Ops.set(Drbd.lvm_config, "filter", @filter)
      Ops.set(Drbd.lvm_config, "write_cache_state", cache)

      Drbd.modified = true

      true
    end

    def ConfigureLVMDialog
      lvm_conf_Read

      my_SetContents("lvm_conf", lvm_conf_GetDialog)

      ret = nil
      while true
        Wizard.SelectTreeItem("lvm_conf")

        ret = UI.UserInput

        if ret == :help
          #myHelp("lvm_conf")
          next
        end

        if ret == :wizardTree
          ret = Convert.to_string(UI.QueryWidget(Id(:wizardTree), :CurrentItem))
        end

        if ret == "Filter" || ret == "LVMCache"
          Drbd.modified = true
          next
        end

        if ret == :abort || ret == :cancel
          if ReallyAbort()
            return deep_copy(ret)
          else
            next
          end
        end

        if ret == :next || ret == :back ||
            Builtins.contains(@DIALOG, Builtins.tostring(ret))
          next if !lvm_conf_Write

          if ret != :next && ret != :back
            ret = Builtins.symbolof(Builtins.toterm(ret))
          end

          break
        end
      end
      deep_copy(ret)
    end
  end
end
