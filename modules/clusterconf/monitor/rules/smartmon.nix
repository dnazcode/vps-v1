[
  {
    name = "smartmon";
    interval = "1h";
    rules = [
      {
        alert = "DiskLowAvailableReservedSpace";
        expr = ''smartmon_available_reservd_space_value < 75'';
        labels = {
          severity = "warning";
          frequency = "weekly";
        };
        annotations = {
          summary = "Reserved space is running out (instance {{ $labels.instance }})";
          description = ''
            SMART reported Available_Reservd_Space < 75

            VALUE = {{ $value }}
            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "DiskCritAvailableReservedSpace";
        expr = ''smartmon_available_reservd_space_value < 20'';
        labels = {
          severity = "critical";
          frequency = "daily";
        };
        annotations = {
          summary = "Reserved space is running out (instance {{ $labels.instance }})";
          description = ''
            SMART reported Available_Reservd_Space < 20

            VALUE = {{ $value }}
            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "DiskHighMediaWearoutIndicator";
        expr = ''smartmon_media_wearout_indicator_value < 25'';
        labels = {
          severity = "warning";
          frequency = "weekly";
        };
        annotations = {
          summary = "SSD nearing wearing out (instance {{ $labels.instance }})";
          description = ''
            SMART reported Media_Wearout_Indicator < 25

            VALUE = {{ $value }}
            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "DiskLowSsdLifeLeft";
        expr = ''smartmon_ssd_life_left_value < 25'';
        labels = {
          severity = "warning";
          frequency = "weekly";
        };
        annotations = {
          summary = "SSD nearing end-of-life (instance {{ $labels.instance }})";
          description = ''
            SMART reported SSD_Life_Left < 25

            VALUE = {{ $value }}
            LABELS: {{ $labels }}
          '';
        };
      }
    ];
  }
]
