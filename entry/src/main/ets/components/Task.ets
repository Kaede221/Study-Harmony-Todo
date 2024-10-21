@Component
export struct Task {
  @Prop taskTitle: string
  @State ifDel: boolean = false
  @State isDone: boolean = false

  build() {
    // 实现一个简单的任务, 直接是一个Row即可
    Row() {
      Text(this.taskTitle)
        .fontSize(22)
        .fontWeight(this.isDone ? FontWeight.Medium : FontWeight.Normal)
        .decoration({
          type: this.isDone ? TextDecorationType.LineThrough : TextDecorationType.None
        })
      Toggle({
        type: ToggleType.Checkbox,
        isOn: this.isDone
      })
        .onClick(() => {
          this.isDone = !this.isDone
        })
    }
    .visibility(this.ifDel ? Visibility.None : Visibility.Visible)
    .margin({ bottom: 5 })
    .padding({ left: 10, right: 10 })
    .backgroundColor("#f2f2f2")
    .width("100%")
    .justifyContent(FlexAlign.SpaceBetween)
    .borderRadius(5)
    .height(50)
    .onClick(() => {
      this.isDone = !this.isDone
    })
    .gesture(
      LongPressGesture()
        .onAction(() => {
          AlertDialog.show({
            title: "提示",
            message: "你要删除这个条目吗?",
            primaryButton: {
              value: "确认",
              action: () => {
                // 删除, 其实可以理解为隐藏这个组件即可
                this.ifDel = true;
              },
              fontColor: Color.Red
            },
            secondaryButton: {
              value: "取消",
              action: () => {
              }
            }
          })
        })
    )
  }
}