# encoding: utf-8

# ------------------------------------------------------------------------------
# Copyright (c) 2006 Novell, Inc. All Rights Reserved.
#
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of version 2 of the GNU General Public License as published by the
# Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail, you may find
# current contact information at www.novell.com.
# ------------------------------------------------------------------------------

# File:	include/drbd/helps.ycp
# Package:	Configuration of drbd
# Summary:	Help texts of all the dialogs
# Authors:	xwhu <xwhu@novell.com>
#
# $Id: helps.ycp 27914 2006-02-13 14:32:08Z locilka $
module Yast
  module DrbdHelpsInclude
    def initialize_drbd_helps(include_target)
      textdomain "drbd"

      # All helps are here
      @HELPS = {
        # Read dialog help 1/2
        "read"          => _(
          "<p><b><big>Initializing DRBD Configuration</big></b><br>\nPlease wait...<br></p>\n"
        ) +
          # Read dialog help 2/2
          _(
            "<p><b><big>Aborting Initialization:</big></b><br>\nSafely abort the configuration utility by pressing <b>Abort</b> now.</p>\n"
          ),
        # Write dialog help 1/2
        "write"         => _(
          "<p><b><big>Saving DRBD Configuration</big></b><br>\nPlease wait...<br></p>\n"
        ) +
          # Write dialog help 2/2
          _(
            "<p><b><big>Aborting Saving:</big></b><br>\n" +
              "Abort the save procedure by pressing <b>Abort</b>.\n" +
              "An additional dialog informs whether it is safe to do so.\n" +
              "</p>\n"
          ),
        "start_conf"    => _("Start to configure DRBD."),
        "startup_conf"  => _(
          "<p><b><big>Startup Configuration of DRBD</big></b></p>"
        ) +
          _(
            "<p><b>Booting:</b></p>\n" +
              "\t\t\t<p>checking \"On\" to start DRBD server Now and when booting</p>\n" +
              "\t\t\t<p>checking \"Off\", DRBD server only starts manually</p>\n" +
              "\t\t<p><b>Switch On and Off:</b></p>\n" +
              "\t\t\t<p>Starting or Stopping DRBD Server right now</p>\n" +
              "\t\t"
          ),
        "resource_conf" => _(
          "<p><b><big>Resource Configuration of DRBD</big></b></p>"
        ) +
          _(
            "<p>Clicking \"Add\", \"Edit\", \"Delete\" button to add, edit or delete a resource</p>\n\t\t"
          ),
        "basic_conf"    => _(
          "<p><b><big>Resource Configuration of DRBD</big></b></p>"
        ) +
          _(
            "\n" +
              "\t\t<p>\"Name\" is mandatory and must match the Linux host name (uname -n) of one of the nodes. Should not include \".\" in hostname.</p>\n" +
              "\t\t<p>\"Address:Port\": A resource needs one IP address per device, which is used to wait for incoming connections from the partner device to reach the device. Each DRBD resource needs a TCP port which is used to connect to the node's partner device.</p>\n" +
              "\t\t<p>\"Device\": The name of the block device node of the resource being described. You must use this device with your application (file system) and you must not use the low level block device which is specified with the disk parameter,following its minor number. Otherwise, you may omit the name, or the word minor and its number. If you omit the name a default of /dev/drbd'minor number' will be used.\n" +
              "\t\tLike: '/dev/drbd{service} minor {minor drbd number [0...255]}' or '/dev/drbd{minor drbd number [0...255]}'</p>\n" +
              "\t\t<p>\"Disk\":  DRBD uses this block device to actually store and retrieve the data.  Never access such a device while DRBD is running on top of  it.</p>\n" +
              "\t\t<p>\"Meta-disk\": internal. Internal means that the last part of the backing device is used to store the meta-data.</p>\n" +
              "\t\t"
          ),
        "advance_conf"  => _(
          "<p><b><big>Resource Configuration of DRBD</big></b></p>"
        ) +
          _(
            "\n" +
              "\t\t<p><b>Protocol</b></p>\n" +
              "\t\t<p>Protocol A: write IO is reported as completed, if it has reached local disk and local TCP send buffer.</p>\n" +
              "\t\t<p>Protocol B: write IO is reported as completed, if it has reached local disk and remote buffer cache.</p>\n" +
              "\t\t<p>Protocol C: write IO is reported as completed, if it has reached both local and remote disk.</p>\n" +
              "\t\t\t\t\t\t\t\t\t\t  \n" +
              "\t\t<p><b>wfc-timeout</b>: Wait for connection timeout</p>\n" +
              "\t\t<p><b>degr-wfc-timeout</b>: Wait for connection timeout, if this node was a degraded cluster</p>\n" +
              "\n" +
              "\t\t<p><b>on-io-error</b>: What to do when the lower level device reports io-error to the upper layers</p>\n" +
              "\t\t<p><b>sndbuf-size</b>: The size of the TCP socket send buffer</p>\n" +
              "\t\t<p><b>max-buffers</b>: Maximum number of requests to be allocated by DRBD</p>\n" +
              "\n" +
              "\t\t<p><b>timeout</b>: If the partner node fails to send an expected response packet within time 10ths of a second, the partner node is considered dead and therefore  the TCP/IP connection is abandoned. This must be lower than connect-int and ping-int. The default value is 60 = 6 seconds, the unit 0.1 seconds.</p>\n" +
              "\t\t<p><b>connect-int</b>: The time the peer has time to answer to a keep-alive packet. In case the peer's reply is not received within this time period, it is considered as dead. The default value is 500ms, the default unit is 100ms</p>\n" +
              "\t\t<p><b>ping-int</b>: The time the peer has time to answer to a keep-alive packet</p>\n" +
              "\n" +
              "\t\t<p><b>max-epoch-size</b>: The highest number of data blocks between two write barriers</p>\n" +
              "\t\t<p><b>ko-count</b>: the secondary node fails to complete a single write request for count times the timeout, it is expelled from the cluster. The default value is 0, which disables this feature.</p>\n" +
              "\t\t<p><b>rate</b>: To  ensure a smooth operation of the application on top of DRBD, it is possible to limit the bandwidth which may be used by background synchronizations. The default is 250 KB/sec, the default unit is KB/sec.</p>\n" +
              "\t\t<p><b>al-extents</b>: parameter  you control how big the hot area (= active set) can get. The default number of extents is 127. (Minimum: 7, Maximum: 3843)</p>\n" +
              "\t\t"
          ),
         "lvm_conf"  => _(
          "<p><b><big>LVM Configuration</big></b></p>"
        ) +
          _(
            "\n" +
              "\t\t<p><b>LVM configuration file /etc/lvm/lvm.conf</b></p>\n" +
              "\t\t<p>To use LVM with DRBD, it is necessary to change some options in the LVM configuration file and to remove stale cache entries on the nodes.</p>" +
              "\t\t<p>Refer to 'man lvm.conf' for further information including the file layout.</p>\n" +
              "\t\t\t\t\t\t\t\t\t\t  \n" +
              "\t\t<p><b>Device Filter</b>: This masks the underlying block device from the list of devices LVM scans for Physical Volume signatures. This way, LVM is instructed to read Physical Volume signatures from DRBD devices, rather than from the underlying backing block devices.</p>" +
              "\t\t<p><b>AutoFilter</b>: According to the configuration of drbd, LVM filter will always be changed automatically. To change it manually, disable the checkbox of AutoFilter.</p>\n" +
              "\t\t<p>The filter consists of an array of regular expressions. These expressions can be delimited by a character of your choice, and prefixed with either an 'a' (for accept) or 'r' (for reject).</p>" +
              "\t\t<p>For example, setting filter as [\"r|/dev/sda.*|\"]</p>\n" +
              "\n" +
              "\t\t<p><b>LVM cache</b>: Enable/turn on writing the LVM cache is default. Disable cache when for network storage, like nfs. </p>\n" +
              "\n" +
              "\t\t<p><b>LVMetad</b>: When lvmetad is enabled, the volume group metadata and PV state flags are obtained from the lvmetad instance and no scanning is done by the individual commands. Because lvmetad's cache cannot be synchronized between nodes, users are advised to disable lvmetad in cluster environments.</p>\n" +
              "\n" +
              "\t\t"
          ),
        "global_conf"   => _(
          "<p><b><big>Global Configuration of DRBD</big></b></p>"
        ) +
          _(
            "<p>Check <b>\"Disable IP Verification\"</b> to disable one of drbdadm's sanity check</p>"
          ) +
          _(
            "<p><b>Dialog Refresh:</b> The user dialog counts and displays the seconds it waited so\n" +
              "                far. You might want to disable this if you have the console\n" +
              "                of your server connected to a serial terminal server with\n" +
              "                limited logging capacity.\n" +
              "                The Dialog will print the count each 'dialog-refresh' seconds,\n" +
              "                set it to 0 to disable redrawing completely. </p>"
          ) +
          _(
            "<p><b>Minor Count:</b>\n" +
              "           use this if you want to define more resources later\n" +
              "           without reloading the module.\n" +
              "           by default we load the module with exactly as many devices\n" +
              "           as configured mentioned in this file. </p>"
          ),
        # Summary dialog help 1/3
        "summary"       => _(
          "<p><b><big>DRBD Configuration</big></b><br>\nConfigure drbd here.<br></p>\n"
        ) +
          # Summary dialog help 2/3
          _(
            "<p><b><big>Adding a drbd:</big></b><br>\n" +
              "Choose an drbd from the list of detected drbds.\n" +
              "If your drbd was not detected, use <b>Other (not detected)</b>.\n" +
              "Then press <b>Configure</b>.</p>\n"
          ) +
          # Summary dialog help 3/3
          _(
            "<p><b><big>Editing or Deleting:</big></b><br>\n" +
              "If you press <b>Edit</b>, an additional dialog in which to change\n" +
              "the configuration opens.</p>\n"
          ),
        # Ovreview dialog help 1/3
        "overview"      => _(
          "<p><b><big>DRBD Configuration Overview</big></b><br>\n" +
            "Obtain an overview of installed drbds. Additionally\n" +
            "edit their configurations.<br></p>\n"
        ) +
          # Ovreview dialog help 2/3
          _(
            "<p><b><big>Adding a drbd:</big></b><br>\nPress <b>Add</b> to configure a drbd.</p>"
          ) +
          # Ovreview dialog help 3/3
          _(
            "<p><b><big>Editing or Deleting:</big></b><br>\n" +
              "Choose a drbd to change or remove.\n" +
              "Then press <b>Edit</b> or <b>Delete</b> as desired.</p>\n"
          ),
        # Configure1 dialog help 1/2
        "c1"            => _(
          "<p><b><big>Configuration Part One</big></b><br>\n" +
            "Press <b>Next</b> to continue.\n" +
            "<br></p>"
        ) +
          # Configure1 dialog help 2/2
          _(
            "<p><b><big>Selecting Something</big></b><br>\n" +
              "It is not possible. You must code it first. :-)\n" +
              "</p>"
          ),
        # Configure2 dialog help 1/2
        "c2"            => _(
          "<p><b><big>Configuration Part Two</big></b><br>\n" +
            "Press <b>Next</b> to continue.\n" +
            "<br></p>\n"
        ) +
          # Configure2 dialog help 2/2
          _(
            "<p><b><big>Selecting Something</big></b><br>\n" +
              "It is not possible. You must code it first. :-)\n" +
              "</p>"
          )
      } 

      # EOF
    end
  end
end
