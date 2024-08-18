# ACM Conversational User Interfaces community website

The ACM CUI community website is build using Jekyll, on GitHub Pages.

## Steering Commmitee data

Information about officers and members of the Steering Commmittee is stored in `_data/steering_committee.yml` in two lists, one for _Officers_ and one for _Members_. Each list item consists of an associative array with the following structure:

| **Key** | **Required?** | **Type** | **Explanation**                                                                                                                                         | **Example**                              |
|---------|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------|
| name    | Yes           | string   | Name of the Officer/Member                                                                                                                              | `Minha Lee`                              |
| photo   | Yes           | string   | Filename of a square profile photo the Officer/Member, stored in `assets/img/sc/`                                                                       | `minha-lee.png`                          |
| url     | No            | string   | URL/personal website for the Officer/Member                                                                                                             | `https://minha-lee.github.io`            |
| roles   | No            | list     | List of associate arrays, for each role the Officer/Member holds on the committee. Each array consists of two keys: `role` (string) and `term` (string) | `role: Co-Chair<br>term: 2024–2027`      |                   |
| bio     | Yes           | string   | Biography for the Officer/Member                                                                                                                        | `Minha Lee is an Assistant Professor...` |

## Conference data

Data from annual conferences is stored in a number of different files and locations.

### Conferences list (and the sidebar)

Primary conference data (that is, conference names, dates, URLs, and sponsors) is stored in `_data/conferences.yml` file. Data is stored as a series of associative arrays, one for each year of the conference. Each associative array should be given the key of the full conference year (e.g., `2025`). Each associative array consists of a series of items, each of which are described below.

| **Key**     | **Required?** | **Type**      | **Explanation**                                                                                                                     | **Example**                                                  |
|-------------|---------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| name        | Yes           | string        | Name of the conference                                                                                                              | `ACM CUI 2025`                                               |
| location    | Yes           | string        | Location of the conference                                                                                                          | `Waterloo, ON, Canada`                                       |
| dates       | Yes           | assoc. array  | Must contain two items:  _start_ and _end_, both of which are dates formatted as YYYY-MM-DD                                         | `start: 2025-07-08 end: 2025-07-10`                          |
| logo        | Yes           | string        | Filename for a square image stored in `assets/img/conferences/`                                                                     | `cui2025.png`                                                |
| urls        | No            | assoc. array  | Names and URLs for different conference pages. Expected keys: _website_, _proceedings_, and _programme_                             | `website:   name: Website   link: https://cui.acm.org/2025/` |
| sponsors    | No            | list          | Names and URLs for conference sponsors                                                                                              | `- name: SIGCHI   link: https://www.sigchi.org/`             |
| listdetails | No            | assoc. array  | Information used in the conference list page. Supported keys: _preamble_ (adds text prior to the 'About' summary for a conference') | `preamble: >   Where it all began!`                          |

### Conference awards

Awards given out at conferences are stored in `_data/awards.yml` file. This file contains three associative arrays, `honourable_mentions`, `best_papers`, and `outstanding_service`. The value of each of these associative arrays is an associative array, consisting of a key which matches a conference year included in the primary conference data (see above), and a list of awards, using the following structure.

| **Key** | **Required?** | **Type** | **Explanation**                 | **Example**                                                                    |
|---------|---------------|----------|---------------------------------|--------------------------------------------------------------------------------|
| title   | Yes           | string   | Title of the publication        | `title: Progressivity for Voice Interface Design`                              |
| authors | Yes           | string   | Authors list, with Oxford comma | `authors: Joel E Fischer, Stuart Reeves, Martin Porcheron, and Rein Sikveland` |
| dl      | No            | string   | ACM Digital Library link        | `dl: https://doi.org/10.1145/3342775.3342788`                                  |

### Conference statistics

The file `_data/statistics.yml` contains programme and registration statistics for each conference year. There are four associative arrays in this file.

The `years` list is the years for which should be included in conference statistics. This can be used to avoid including empty data for a conference before any statistics have been compiled, but after tracks have been entered.

The `registrations_footnotes` list is a series of explanations for registration numbers. Each footnote may be reused for more than one conference. Conferences can attach a footnote using the `footnote_id` key.

The `registrations` associative array has the following structure:

| **Key**     | **Required?** | **Type** | **Explanation**                                                                                                              | **Example**      |
|-------------|---------------|----------|------------------------------------------------------------------------------------------------------------------------------|------------------|
| total       | Yes           | string   | Total number of registrations including free registrations such as invited speakers, student volunteers, and organisers etc. | `total: 67`      |
| virtual     | Yes           | string   | Number of registrations for remote/virtual attendance                                                                        | `virtual: 0`     |
| footnote_id | No            | int      | Index of a footnote (from `registrations_footnotes` list). Starting index is 1 (i.e., first footnote is index 1).            | `footnote_id: 1` |

The `tracks` list contains items with the following structure:

| **Key**  | **Required?** | **Type**     | **Explanation**                                          | **Example**                                |
|----------|---------------|--------------|----------------------------------------------------------|--------------------------------------------|
| title    | Yes           | string       | Name of the track                                        | `title: Doctoral Consortium`               |
| lang     | Yes           | string       | How to describe submissions/acceptances (in a sentence)  | `title: Doctoral Consortium submissions`   |
| data     | No            | assoc. array | Submissions and acceptances for a track for a given year | `2019:   submissions: 28   acceptances: 9` |


## Workshops list

Workshops can be added and modified in the `_data/workshops.yml` file. The newest conference should be at the top of the list.