; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/2_vp5_adjust_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r1/functions/ffmpeg/variants/c/2_vp5_adjust_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @vp5_adjust(i32 noundef 0, i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @vp5_adjust(i32 noundef %v, i32 noundef %t) #0 {
entry:
  %retval = alloca i32, align 4
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %limit = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %0
  store i32 %mul, ptr %limit, align 4
  %1 = load i32, ptr %t.addr, align 4
  %cmp = icmp sle i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %3 = load i32, ptr %limit, align 4
  %sub = sub nsw i32 0, %3
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %4 = load i32, ptr %limit, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %4, %cond.false ]
  store i32 %cond, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %5 = load i32, ptr %v.addr, align 4
  %cmp2 = icmp sge i32 %5, 0
  br i1 %cmp2, label %if.then3, label %if.end13

if.then3:                                         ; preds = %if.end
  %6 = load i32, ptr %v.addr, align 4
  %7 = load i32, ptr %t.addr, align 4
  %cmp4 = icmp sle i32 %6, %7
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.then3
  %8 = load i32, ptr %v.addr, align 4
  store i32 %8, ptr %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.then3
  %9 = load i32, ptr %v.addr, align 4
  %10 = load i32, ptr %limit, align 4
  %cmp7 = icmp slt i32 %9, %10
  br i1 %cmp7, label %cond.true8, label %cond.false10

cond.true8:                                       ; preds = %if.end6
  %11 = load i32, ptr %limit, align 4
  %12 = load i32, ptr %v.addr, align 4
  %sub9 = sub nsw i32 %11, %12
  br label %cond.end11

cond.false10:                                     ; preds = %if.end6
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true8
  %cond12 = phi i32 [ %sub9, %cond.true8 ], [ 0, %cond.false10 ]
  store i32 %cond12, ptr %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.end
  %13 = load i32, ptr %v.addr, align 4
  %14 = load i32, ptr %t.addr, align 4
  %sub14 = sub nsw i32 0, %14
  %cmp15 = icmp sge i32 %13, %sub14
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  %15 = load i32, ptr %v.addr, align 4
  store i32 %15, ptr %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end13
  %16 = load i32, ptr %v.addr, align 4
  %17 = load i32, ptr %limit, align 4
  %sub18 = sub nsw i32 0, %17
  %cmp19 = icmp sgt i32 %16, %sub18
  br i1 %cmp19, label %cond.true20, label %cond.false23

cond.true20:                                      ; preds = %if.end17
  %18 = load i32, ptr %limit, align 4
  %sub21 = sub nsw i32 0, %18
  %19 = load i32, ptr %v.addr, align 4
  %sub22 = sub nsw i32 %sub21, %19
  br label %cond.end24

cond.false23:                                     ; preds = %if.end17
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true20
  %cond25 = phi i32 [ %sub22, %cond.true20 ], [ 0, %cond.false23 ]
  store i32 %cond25, ptr %retval, align 4
  br label %return

return:                                           ; preds = %cond.end24, %if.then16, %cond.end11, %if.then5, %cond.end
  %20 = load i32, ptr %retval, align 4
  ret i32 %20
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
