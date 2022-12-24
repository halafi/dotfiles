const WORK_RELATED_HOSTS = [
  "localhost",
  "127.0.0.1",
  "zenhub.com",
  "app.zenhub.com",
  "github.com",
  "zoom.us",
  "cloud.google.com",
  "docs.google.com",
  "chrome.google.com",
  "drive.google.com",
  "meet.google.com",
  "figma.com",
  "developer.chrome.com",
  "groups.google.com",
  "miro.com",
];

module.exports = {
  defaultBrowser: { name: "Google Chrome", profile: "Profile 2" },
  options: {
    hideIcon: true,
    checkForUpdate: true,
    logRequests: false,
  },
  rewrite: [
    {
      // Redirect all urls to use https
      match: ({ url }) => url.protocol === "http" && url.host !== 'localhost' && url.host !== '127.0.0.1',
      url: { protocol: "https" },
    },
  ],
  handlers: [
    {
      match: ({ url }) => WORK_RELATED_HOSTS.includes(url.host),
      browser: {
        name: "Google Chrome",
        profile: "Profile 1",
      },
    },
    {
      // Open any url that includes the string "workplace" in Firefox
      match: /archipelo/, // handle e.g. notion links
      browser: {
        name: "Google Chrome",
        profile: "Profile 1",
      },
    },
  ],
};
