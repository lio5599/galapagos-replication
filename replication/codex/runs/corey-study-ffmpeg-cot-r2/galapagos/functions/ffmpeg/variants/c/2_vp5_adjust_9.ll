; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/2_vp5_adjust_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-cot-r2/functions/ffmpeg/variants/c/2_vp5_adjust_9.c"
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
  %a = alloca i32, align 4
  %r = alloca i32, align 4
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
  store i32 %cond, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %cmp1 = icmp sle i32 %4, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %5 = load i32, ptr %t.addr, align 4
  %6 = load i32, ptr %t.addr, align 4
  %add = add nsw i32 %5, %6
  store i32 %add, ptr %r, align 4
  br label %if.end14

if.else:                                          ; preds = %cond.end
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %t.addr, align 4
  %cmp3 = icmp sle i32 %7, %8
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %if.else
  %9 = load i32, ptr %a, align 4
  br label %cond.end9

cond.false6:                                      ; preds = %if.else
  %10 = load i32, ptr %t.addr, align 4
  %11 = load i32, ptr %a, align 4
  %12 = load i32, ptr %t.addr, align 4
  %sub7 = sub nsw i32 %11, %12
  %sub8 = sub nsw i32 %10, %sub7
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false6, %cond.true5
  %cond10 = phi i32 [ %9, %cond.true5 ], [ %sub8, %cond.false6 ]
  store i32 %cond10, ptr %r, align 4
  %13 = load i32, ptr %r, align 4
  %cmp11 = icmp slt i32 %13, 0
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %cond.end9
  store i32 0, ptr %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then13, %cond.end9
  br label %if.end14

if.end14:                                         ; preds = %if.end, %if.then
  %14 = load i32, ptr %negative, align 4
  %tobool15 = icmp ne i32 %14, 0
  br i1 %tobool15, label %cond.true16, label %cond.false18

cond.true16:                                      ; preds = %if.end14
  %15 = load i32, ptr %r, align 4
  %sub17 = sub nsw i32 0, %15
  br label %cond.end19

cond.false18:                                     ; preds = %if.end14
  %16 = load i32, ptr %r, align 4
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true16
  %cond20 = phi i32 [ %sub17, %cond.true16 ], [ %16, %cond.false18 ]
  ret i32 %cond20
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
