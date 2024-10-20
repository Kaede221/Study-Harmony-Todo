import { Header } from "../components/Header"
import { Task } from "../components/Task"
import { insertTaskDialog } from "../components/MyCustomDialog"

@Entry
@Component
struct Index {
  @State taskListTitles: string[] = ["Hello", 'Test']
  @State insertTaskTitle: string = ""
  // 实例化自定义弹窗
  insertDialog: CustomDialogController = new CustomDialogController({
    builder: insertTaskDialog({ message: this.insertTaskTitle, taskListTitles: this.taskListTitles }),
    alignment: DialogAlignment.Center
  })

  build() {
    Row() {
      Column() {
        // 头部
        Header({ headerTitle: "Todo", dialogMessage: "一个普通的Todo而已\nBy Kaede" })
          .margin({ bottom: 20 })

        // 任务列表
        List() {
          ForEach(this.taskListTitles, (title: string) => {
            ListItem() {
              Task({ taskTitle: title })
            }
          })
        }
        .width("95%")
      }
      .width('100%')

      // 提供一个添加按钮
      Button() {
        Image($r("app.media.add"))
          .width(20)
          .margin(20)
      }
      .position({ x: "76%", y: "90%" })
      .onClick(() => {
        this.insertDialog.open()
      })
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
  }
}