//
// Created by SanBu on 2023/5/18.
//

// You may need to build the project (run Qt uic code generator) to get "ui_main_window.h" resolved

#include "../include/main_window.h"
#include "ui_main_window.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent), ui(new Ui::MainWindow) {
  ui->setupUi(this);
}

MainWindow::~MainWindow() {
  delete ui;
}