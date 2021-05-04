type action = New(string, string, array<string>) | Delete(string) | Update(string, string, string, array<string>)

type bookmark = {
  title: string,
  href: string,
  tags: array<string>
}

let reducer = (state, action) => {
  switch action {
  | New(title, href, tags) => if Belt.Array.length(Belt.Array.keep(state, bookmark => bookmark.href == href)) == 0 {
      Belt.Array.concat(state, [{ title: title, href: href, tags: tags }])
    } else {
      state
    }
  | Delete(href) => Belt.Array.keep(state, bookmark => bookmark.href != href)
  | Update(oldHref, title, newHref, tags) => Belt.Array.map(state, bookmark => if bookmark.href == oldHref {
      { title: title, href: newHref, tags: tags }
    } else {
      bookmark
    })
  }
}

let initialState = [{title: "Neil Parikh", href: "https://www.neilparikh.me", tags: ["home", "neil", "anotherTag", "yetOneMore", "anotherTag2", "yetOneMore2"]},
                    {title: "Github", href: "https://github.com", tags: ["code", "social"]}]

@react.component
let make = () => {
  let (bookmarks, dispatch) = React.useReducer(reducer, initialState)
  <div className={"md:flex py-8 lg:px-8 lg:w-1/2 flex-col space-y-2 divide-y-4 divide-gray-300"}>
    {Belt.Array.map(bookmarks, bookmark => {
      <Bookmark title={bookmark.title} href={bookmark.href} tags={bookmark.tags} key={bookmark.href}
                onDelete={() => dispatch(Delete(bookmark.href))}
                onEdit={(title, href, tags) => dispatch(Update(bookmark.href, title, href, tags))}/>
    })->React.array}
  </div>
}
