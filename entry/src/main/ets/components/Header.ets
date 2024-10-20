@Component
export struct Header {
  @Prop headerTitle: string
  @Prop dialogMessage: string

  build() {
    // 头部就是一个Row, 里面有文本和按钮
    Row() {
      // 文本
      Text(this.headerTitle)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)

      // 按钮
      Button() {
        Image($r("app.media.qs"))
          .width(30)
          .margin(10)
          .onClick(() => {
            // 弹出内容
            AlertDialog.show({
              title: "提示",
              message: this.dialogMessage,
              alignment: DialogAlignment.Center
            })
          })
      }
      .backgroundColor(Color.Transparent)
    }
    .height(70)
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 20, right: 20 })
    .backgroundColor("#007dfe")
    .shadow({
      radius: 5,
      color: Color.Gray,
      offsetY: 1
    })
  }
}