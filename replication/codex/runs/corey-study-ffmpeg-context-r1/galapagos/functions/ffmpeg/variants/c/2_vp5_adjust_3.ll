; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r1/functions/ffmpeg/variants/c/2_vp5_adjust_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-context-r1/functions/ffmpeg/variants/c/2_vp5_adjust_3.c"
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
  %magnitude = alloca i32, align 4
  %selected = alloca i32, align 4
  %difference = alloca i32, align 4
  %distance = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %2, %cond.false ]
  store i32 %cond, ptr %magnitude, align 4
  %3 = load i32, ptr %magnitude, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  %cmp1 = icmp slt i32 %3, %mul
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  %5 = load i32, ptr %magnitude, align 4
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  br label %cond.end4

cond.end4:                                        ; preds = %cond.false3, %cond.true2
  %cond5 = phi i32 [ %5, %cond.true2 ], [ 0, %cond.false3 ]
  store i32 %cond5, ptr %selected, align 4
  %6 = load i32, ptr %selected, align 4
  %7 = load i32, ptr %t.addr, align 4
  %sub6 = sub nsw i32 %6, %7
  store i32 %sub6, ptr %difference, align 4
  %8 = load i32, ptr %difference, align 4
  %cmp7 = icmp slt i32 %8, 0
  br i1 %cmp7, label %cond.true8, label %cond.false10

cond.true8:                                       ; preds = %cond.end4
  %9 = load i32, ptr %difference, align 4
  %sub9 = sub nsw i32 0, %9
  br label %cond.end11

cond.false10:                                     ; preds = %cond.end4
  %10 = load i32, ptr %difference, align 4
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true8
  %cond12 = phi i32 [ %sub9, %cond.true8 ], [ %10, %cond.false10 ]
  store i32 %cond12, ptr %distance, align 4
  %11 = load i32, ptr %t.addr, align 4
  %12 = load i32, ptr %distance, align 4
  %sub13 = sub nsw i32 %11, %12
  store i32 %sub13, ptr %result, align 4
  %13 = load i32, ptr %v.addr, align 4
  %cmp14 = icmp slt i32 %13, 0
  br i1 %cmp14, label %cond.true15, label %cond.false17

cond.true15:                                      ; preds = %cond.end11
  %14 = load i32, ptr %result, align 4
  %sub16 = sub nsw i32 0, %14
  br label %cond.end18

cond.false17:                                     ; preds = %cond.end11
  %15 = load i32, ptr %result, align 4
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false17, %cond.true15
  %cond19 = phi i32 [ %sub16, %cond.true15 ], [ %15, %cond.false17 ]
  ret i32 %cond19
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
