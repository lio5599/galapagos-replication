; ModuleID = '/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-baseline-r3-restart/functions/ffmpeg/variants/c/2_vp5_adjust_9.bc'
source_filename = "/home/cbhei/galapagos-corey-runs/corey-study-ffmpeg-baseline-r3-restart/functions/ffmpeg/variants/c/2_vp5_adjust_9.c"
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
  %v.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  %negative = alloca i32, align 4
  %magnitude = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, ptr %negative, align 4
  %1 = load i32, ptr %negative, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %2
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  %4 = load i32, ptr %magnitude, align 4
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  %cmp1 = icmp slt i32 %4, %mul
  %conv2 = zext i1 %cmp1 to i32
  switch i32 %conv2, label %sw.default [
    i32 0, label %sw.bb
  ]

sw.bb:                                            ; preds = %cond.end
  %6 = load i32, ptr %t.addr, align 4
  %7 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp slt i32 %7, 0
  br i1 %cmp3, label %cond.true5, label %cond.false7

cond.true5:                                       ; preds = %sw.bb
  %8 = load i32, ptr %t.addr, align 4
  %sub6 = sub nsw i32 0, %8
  br label %cond.end8

cond.false7:                                      ; preds = %sw.bb
  %9 = load i32, ptr %t.addr, align 4
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false7, %cond.true5
  %cond9 = phi i32 [ %sub6, %cond.true5 ], [ %9, %cond.false7 ]
  %sub10 = sub nsw i32 %6, %cond9
  store i32 %sub10, ptr %result, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %cond.end
  %10 = load i32, ptr %magnitude, align 4
  %11 = load i32, ptr %t.addr, align 4
  %cmp11 = icmp sle i32 %10, %11
  br i1 %cmp11, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %sw.default
  %12 = load i32, ptr %magnitude, align 4
  br label %cond.end17

cond.false14:                                     ; preds = %sw.default
  %13 = load i32, ptr %t.addr, align 4
  %mul15 = mul nsw i32 2, %13
  %14 = load i32, ptr %magnitude, align 4
  %sub16 = sub nsw i32 %mul15, %14
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false14, %cond.true13
  %cond18 = phi i32 [ %12, %cond.true13 ], [ %sub16, %cond.false14 ]
  store i32 %cond18, ptr %result, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %cond.end17, %cond.end8
  %15 = load i32, ptr %negative, align 4
  %tobool19 = icmp ne i32 %15, 0
  br i1 %tobool19, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %sw.epilog
  %16 = load i32, ptr %result, align 4
  %sub21 = sub nsw i32 0, %16
  br label %cond.end23

cond.false22:                                     ; preds = %sw.epilog
  %17 = load i32, ptr %result, align 4
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true20
  %cond24 = phi i32 [ %sub21, %cond.true20 ], [ %17, %cond.false22 ]
  ret i32 %cond24
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
