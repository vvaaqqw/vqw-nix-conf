{ pkgs, username, ... }:

let
  session = "niri-session";
in
{
  environment.systemPackages = with pkgs; [
    tuigreet   
  ];

  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      initial_session = {
        command = "${session}";
        user = "${username}";
      };
      default_session = {
        command = "tuigreet --greeting 'HEY' --asterisks --remember --remember-user-session --time -cmd ${session}";
        user = "greeter";
      };
    };
  };
}
