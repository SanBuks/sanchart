//
// Created by SanBu on 2023/5/18.
//

#ifndef SANCHART_FORMS_MAIN_WINDOW_H_
#define SANCHART_FORMS_MAIN_WINDOW_H_

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow {
 Q_OBJECT

 public:
  explicit MainWindow(QWidget *parent = nullptr);
  ~MainWindow() override;

 private:
  Ui::MainWindow *ui;
};

#endif //SANCHART_FORMS_MAIN_WINDOW_H_
