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
  %s1 = alloca i32, align 4
  %a = alloca i32, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %1 = zext i1 %cmp to i64
  %cond = select i1 %cmp, i32 -1, i32 0
  store i32 %cond, ptr %s1, align 4
  %2 = load i32, ptr %s1, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, ptr %v.addr, align 4
  %sub = sub nsw i32 0, %3
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %v.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond1 = phi i32 [ %sub, %cond.true ], [ %4, %cond.false ]
  store i32 %cond1, ptr %a, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %6
  %cmp2 = icmp slt i32 %5, %mul
  br i1 %cmp2, label %cond.true3, label %cond.false4

cond.true3:                                       ; preds = %cond.end
  %7 = load i32, ptr %a, align 4
  br label %cond.end5

cond.false4:                                      ; preds = %cond.end
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true3
  %cond6 = phi i32 [ %7, %cond.true3 ], [ 0, %cond.false4 ]
  store i32 %cond6, ptr %a, align 4
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %t.addr, align 4
  %cmp7 = icmp slt i32 %8, %9
  br i1 %cmp7, label %cond.true8, label %cond.false9

cond.true8:                                       ; preds = %cond.end5
  %10 = load i32, ptr %a, align 4
  br label %cond.end10

cond.false9:                                      ; preds = %cond.end5
  %11 = load i32, ptr %t.addr, align 4
  br label %cond.end10

cond.end10:                                       ; preds = %cond.false9, %cond.true8
  %cond11 = phi i32 [ %10, %cond.true8 ], [ %11, %cond.false9 ]
  store i32 %cond11, ptr %lo, align 4
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %t.addr, align 4
  %cmp12 = icmp slt i32 %12, %13
  br i1 %cmp12, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %cond.end10
  %14 = load i32, ptr %t.addr, align 4
  br label %cond.end15

cond.false14:                                     ; preds = %cond.end10
  %15 = load i32, ptr %a, align 4
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true13
  %cond16 = phi i32 [ %14, %cond.true13 ], [ %15, %cond.false14 ]
  store i32 %cond16, ptr %hi, align 4
  %16 = load i32, ptr %hi, align 4
  %17 = load i32, ptr %lo, align 4
  %sub17 = sub nsw i32 %16, %17
  store i32 %sub17, ptr %d, align 4
  %18 = load i32, ptr %t.addr, align 4
  %19 = load i32, ptr %d, align 4
  %sub18 = sub nsw i32 %18, %19
  store i32 %sub18, ptr %a, align 4
  %20 = load i32, ptr %s1, align 4
  %tobool19 = icmp ne i32 %20, 0
  br i1 %tobool19, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %cond.end15
  %21 = load i32, ptr %a, align 4
  %sub21 = sub nsw i32 0, %21
  br label %cond.end23

cond.false22:                                     ; preds = %cond.end15
  %22 = load i32, ptr %a, align 4
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true20
  %cond24 = phi i32 [ %sub21, %cond.true20 ], [ %22, %cond.false22 ]
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
