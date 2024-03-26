[
  {
    name = "nodectld";
    rules = [
      {
        alert = "NodectldPaused";
        expr = ''nodectld_state_paused == 1'';
        for = "30m";
        labels = {
          severity = "critical";
          frequency = "10m";
        };
        annotations = {
          summary = "nodectld is paused (instance {{ $labels.instance }})";
          description = ''
            nodectld is paused and not executing transactions

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsStartStalled";
        expr = ''nodectld_command_seconds{handler="Vps::Start"} > 60*20'';
        labels = {
          severity = "fatal";
          frequency = "10m";
        };
        annotations = {
          summary = "VPS start has stalled (instance {{ $labels.instance }})";
          description = ''
            VPS takes more than 20 minutes to start

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsStopStalled";
        expr = ''nodectld_command_seconds{handler="Vps::Stop"} > 60*20'';
        labels = {
          severity = "fatal";
          frequency = "10m";
        };
        annotations = {
          summary = "VPS stop has stalled (instance {{ $labels.instance }})";
          description = ''
            VPS takes more than 20 minutes to stop, it is quite likely stuck

            LABELS: {{ $labels }}
          '';
        };
      }

      {
        alert = "VpsRestartStalled";
        expr = ''nodectld_command_seconds{handler="Vps::Restart"} > 60*20'';
        labels = {
          severity = "critical";
          frequency = "10m";
        };
        annotations = {
          summary = "VPS restart has stalled (instance {{ $labels.instance }})";
          description = ''
            VPS takes more than 20 minutes to restart, it is quite likely stuck

            LABELS: {{ $labels }}
          '';
        };
      }
    ];
  }
]
