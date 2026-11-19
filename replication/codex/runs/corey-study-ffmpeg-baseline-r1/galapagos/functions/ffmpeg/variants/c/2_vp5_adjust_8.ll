; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1/functions/ffmpeg/variants/c/2_vp5_adjust_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-ffmpeg-baseline-r1/functions/ffmpeg/variants/c/2_vp5_adjust_8.c"
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
  %d = alloca i32, align 4
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
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %5
  %cmp1 = icmp slt i32 %4, %mul
  %conv2 = zext i1 %cmp1 to i32
  switch i32 %conv2, label %sw.default [
    i32 0, label %sw.bb
  ]

sw.bb:                                            ; preds = %cond.end
  %6 = load i32, ptr %t.addr, align 4
  %sub3 = sub nsw i32 0, %6
  store i32 %sub3, ptr %d, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %cond.end
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %t.addr, align 4
  %sub4 = sub nsw i32 %7, %8
  store i32 %sub4, ptr %d, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  %9 = load i32, ptr %d, align 4
  %cmp5 = icmp slt i32 %9, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %sw.epilog
  %10 = load i32, ptr %d, align 4
  %sub7 = sub nsw i32 0, %10
  store i32 %sub7, ptr %d, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.epilog
  %11 = load i32, ptr %t.addr, align 4
  %12 = load i32, ptr %d, align 4
  %sub8 = sub nsw i32 %11, %12
  store i32 %sub8, ptr %r, align 4
  %13 = load i32, ptr %negative, align 4
  %tobool9 = icmp ne i32 %13, 0
  br i1 %tobool9, label %cond.true10, label %cond.false12

cond.true10:                                      ; preds = %if.end
  %14 = load i32, ptr %r, align 4
  %sub11 = sub nsw i32 0, %14
  br label %cond.end13

cond.false12:                                     ; preds = %if.end
  %15 = load i32, ptr %r, align 4
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false12, %cond.true10
  %cond14 = phi i32 [ %sub11, %cond.true10 ], [ %15, %cond.false12 ]
  ret i32 %cond14
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
