{...}: {
  # clipboard manager
  services.clipse = {
    enable = true;
    historySize = 777;
    imageDisplay.type = "kitty";
    theme = {
      useCustomTheme = true;
      DimmedDesc = "#928374";
      DimmedTitle = "#928374";
      FilteredMatch = "#fabd2f";
      NormalDesc = "#ebdbb2";
      NormalTitle = "#ebdbb2";
      SelectedDesc = "#fb4934";
      SelectedTitle = "#fb4934";
      SelectedBorder = "#fb4934";
      SelectedDescBorder = "#fb4934";
      TitleFore = "#ebdbb2";
      TitleBack = "#282828";
      StatusMsg = "#d5c4a1";
      PinIndicatorColor = "#cc241d";
    };
  };
}
