import FLXView
import UIKit

let flexView = FLXView()
flexView.backgroundColor = UIColor.whiteColor()
flexView.childAlignment = .Stretch
flexView.direction = .Column
flexView.padding = FLXPadding(top: 8, left: 0, bottom: 8, right: 0)

let header = FLXView()
header.childAlignment = .Center
header.direction = .Row
header.flx_margins = FLXMargins(top: 0, left: 8, bottom: 0, right: 8)
flexView.addSubview(header)

let avatar = Avatar(image: Bird6)
avatar.flx_layoutStrategy = FLXLayoutStrategy.fixed(CGSize(width: 80, height: 80))
avatar.flx_margins = FLXMargins(top: 8, left: 8, bottom: 8, right: 8)
avatar.flx_selfAlignment = .Start
header.addSubview(avatar)

let title = Label(text: "Necropsittacus Borbonicus", align: .Left, fontSize: 24)
title.flx_flex = 1
title.flx_margins = FLXMargins(top: 8, left: 8, bottom: 8, right: 8)
header.addSubview(title)

let subtitle = Label(text: "A pretty but unfortunately extinct bird.", align: .Left)
subtitle.flx_margins = FLXMargins(top: 8, left: 8, bottom: 8, right: 8)
flexView.addSubview(subtitle)

flexView.addSubview(Separator())

let body = Label(text: infoText, align: .Left, fontSize: 16)
body.flx_margins = FLXMargins(top: 8, left: 8, bottom: 8, right: 8)
flexView.addSubview(body)

flexView.addSubview(Separator())

let tags = Label(text: "Tags:", align: .Left)
tags.flx_margins = FLXMargins(top: 8, left: 8, bottom: 8, right: 8)
flexView.addSubview(tags)

let tagList = FLXView(frame: CGRectMake(0, 0, 200, 200))
tagList.childAlignment = .Start
tagList.direction = .Row
tagList.flx_margins = FLXMargins(top: 0, left: 8, bottom: 8, right: 8)
tagList.wrap = true
flexView.addSubview(tagList)

for tagName in ["Bird", "Extinct", "Red", "Réunion", "Parrot", "Psittacinae"] {
    let tag = Tag(name: tagName)
    tag.flx_margins = FLXMargins(top: 0, left: 0, bottom: 4, right: 4)
    tagList.addSubview(tag)
}

flexView.addSubview(Separator())

let friends = Label(text: "Friends:", align: .Left)
friends.flx_margins = FLXMargins(top: 8, left: 8, bottom: 4, right: 8)
flexView.addSubview(friends)

let friendList = FLXView()
friendList.childAlignment = .Start
friendList.direction = .Row
friendList.flx_margins = FLXMargins(top: 0, left: 8, bottom: 4, right: 4)
friendList.wrap = true
flexView.addSubview(friendList)

for image in [ Bird1, Bird2, Bird3, Bird4, Bird5 ] {
    let avatar = Avatar(image: image)

    avatar.flx_margins = FLXMargins(top: 0, left: 0, bottom: 4, right: 4)
    avatar.flx_layoutStrategy = FLXLayoutStrategy.relative { size in
        let width = min((size.width / 4) - 4, 80)
        return CGSize(width: width, height: width)
    }

    friendList.addSubview(avatar)
}

let separator = Separator()
flexView.addSubview(separator)

flexView.bounds.size = flexView.sizeThatFits(CGSize(width: 320, height: CGFloat.max))

flexView.renderAsImage()

header.hidden = true

tags.flx_layoutWhenHidden = true
tags.hidden = true

friends.flx_layoutWhenHidden = true
friends.hidden = true

flexView.bounds.size = flexView.sizeThatFits(CGSize(width: 320, height: CGFloat.max))

flexView.renderAsImage()

