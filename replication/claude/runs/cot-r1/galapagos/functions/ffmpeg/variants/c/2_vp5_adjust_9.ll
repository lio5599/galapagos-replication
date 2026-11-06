; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_9.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_9.c"
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
  %a = alloca i64, align 8
  %tt = alloca i64, align 8
  %c = alloca i64, align 8
  %d = alloca i64, align 8
  %r = alloca i64, align 8
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %v.addr, align 4
  %conv = sext i32 %1 to i64
  %sub = sub nsw i64 0, %conv
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %v.addr, align 4
  %conv1 = sext i32 %2 to i64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ %conv1, %cond.false ]
  store i64 %cond, ptr %a, align 8
  %3 = load i32, ptr %t.addr, align 4
  %conv2 = sext i32 %3 to i64
  store i64 %conv2, ptr %tt, align 8
  %4 = load i64, ptr %a, align 8
  %5 = load i64, ptr %tt, align 8
  %mul = mul nsw i64 2, %5
  %cmp3 = icmp slt i64 %4, %mul
  br i1 %cmp3, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %cond.end
  %6 = load i64, ptr %a, align 8
  br label %cond.end7

cond.false6:                                      ; preds = %cond.end
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true5
  %cond8 = phi i64 [ %6, %cond.true5 ], [ 0, %cond.false6 ]
  store i64 %cond8, ptr %c, align 8
  %7 = load i64, ptr %c, align 8
  %8 = load i64, ptr %tt, align 8
  %sub9 = sub nsw i64 %7, %8
  store i64 %sub9, ptr %d, align 8
  %9 = load i64, ptr %tt, align 8
  %10 = load i64, ptr %d, align 8
  %cmp10 = icmp slt i64 %10, 0
  br i1 %cmp10, label %cond.true12, label %cond.false14

cond.true12:                                      ; preds = %cond.end7
  %11 = load i64, ptr %d, align 8
  %sub13 = sub nsw i64 0, %11
  br label %cond.end15

cond.false14:                                     ; preds = %cond.end7
  %12 = load i64, ptr %d, align 8
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true12
  %cond16 = phi i64 [ %sub13, %cond.true12 ], [ %12, %cond.false14 ]
  %sub17 = sub nsw i64 %9, %cond16
  store i64 %sub17, ptr %r, align 8
  %13 = load i32, ptr %v.addr, align 4
  %cmp18 = icmp slt i32 %13, 0
  br i1 %cmp18, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %cond.end15
  %14 = load i64, ptr %r, align 8
  %sub21 = sub nsw i64 0, %14
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end15
  %15 = load i64, ptr %r, align 8
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true20
  %cond24 = phi i64 [ %sub21, %cond.true20 ], [ %15, %cond.false22 ]
  %conv25 = trunc i64 %cond24 to i32
  ret i32 %conv25
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
