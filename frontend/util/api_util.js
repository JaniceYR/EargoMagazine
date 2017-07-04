export const fetchMagazines = (names) => {
  return $.ajax({
    method: "GET",
    url: "/api/wikis",
    data: names
  });
};
