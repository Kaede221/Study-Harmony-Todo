import promptAction from '@ohos.promptAction';

@Preview
@CustomDialog
export struct insertTaskDialog {
  @State taskListTitles: string[] = []
  @State message: string = ''
  controller: CustomDialogController

  build() {
    // 实现弹窗里面的内容
    // 一个文本框, 两个按钮而已.
    Column({ space: 10 }) {
      Text("提示")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text("你想要新增一个什么任务呢?")
      // 提供一个输入框
      TextInput({ placeholder: "输入任务名称" })
        .onChange((value: string) => {
          this.message = value
        })
      Row() {
        Button("确认")
          .backgroundColor(Color.Transparent)
          .fontColor(Color.Red)
          .onClick(() => {
            // 判断是否为空 空的话就不行
            if (this.message == ''){
              promptAction.showToast({
                message: "你什么都没有输入哦"
              })
            }else{
              this.taskListTitles.push(this.message);
              this.message = "";
              this.controller.close()
            }
          })
        Button("取消")
          .backgroundColor(Color.Transparent)
          .fontColor("#007dfe")
          .onClick(() => {
            // 取消了, 就清空
            this.message = ""
            this.controller.close()
          })
      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width("100%")
    }
    .padding({
      top: 20,
      right: 15,
      left: 15,
      bottom: 5
    })
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}