{
generated,
...
}: let
 system24-theme = generated.vesktop-theme-system24.src;
in {
  config.programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      arRPC = true;
      disableMinSize = true;
      splashTheming = true;
      tray=true;
      minimizeToTray=true;
      checkUpdates=false;
      staticTitle = true;
    };

    vencord = {
       themes = {
          "system24-vencord.theme" = builtins.readFile "${system24-theme}/theme/flavors/system24-vencord.theme.css";
        };
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        useQuickCss = false;
        enabledThemes = ["system24-vencord.theme.css"];
        # themeLinks = ["https://capnkitten.github.io/BetterDiscord/Themes/Spotify-Discord/css/source.css"];
        plugins = {
          SilentTyping.enabled = true;
          AnonymiseFileNames.enabled = true;
          CtrlEnterSend.enabled = true;
          VoiceChatDoubleClick = true;
          ClearURLs.enabled = true;
          CrashHandler.enabled = true;
          EmoteCloner.enabled = true;
          BetterGifAltText.enabled = true;
          BetterGifPicker.enabled = true;
          BetterSettings.enabled = true;
          BetterUploadButton.enabled = true;
          Dearrow.enabled = true;
          FakeNitro.enabled = true;
          FavoriteGifSearch.enabled = true;
          FixSpotifyEmbeds.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          ForceOwnerCrown.enabled = true;
          FriendsSince.enabled = true;
          GifPaste.enabled = true;
          ImageLink.enabled = true;
          ImageZoom.enabled = true;
          MemberCount.enabled = true;
          MentionAvatars.enabled = true;
          MessageLinkEmbeds.enabled = true;
          MessageLogger.enabled = true;
          MutualGroupDMs.enabled = true;
          NoF1.enabled = true;
          PlatformIndicators.enabled = true;
          PreviewMessage.enabled = true;
          RelationshipNotifier.enabled = true;
          ReplyTimestamp.enabled = true;
          ReverseImageSearch.enabled = true;
          ShowHiddenChannels.enabled = true;
          TypingTweaks.enabled = true;
          UnlockedAvatarZoom.enabled = true;
          UnsuppressEmbeds.enabled = true;
          UserVoiceShow.enabled = true;
          ValidReply.enabled = true;
          ValidUser.enabled = true;
          VolumeBooster.enabled = true;
          WebScreenShareFixes.enabled = true;
          YoutubeAdblock.enabled = true;
        };
      };
    };
  };
}
