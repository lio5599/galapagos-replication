; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_7.c"
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
  %a = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %v, ptr %v.addr, align 4
  store i32 %t, ptr %t.addr, align 4
  %0 = load i32, ptr %v.addr, align 4
  %1 = load i32, ptr %v.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  %conv = zext i1 %cmp to i32
  %2 = load i32, ptr %v.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  %conv2 = zext i1 %cmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %mul = mul nsw i32 %0, %sub
  store i32 %mul, ptr %a, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul3 = mul nsw i32 2, %4
  %cmp4 = icmp slt i32 %3, %mul3
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %5 = load i32, ptr %a, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, ptr %c, align 4
  %6 = load i32, ptr %c, align 4
  %7 = load i32, ptr %t.addr, align 4
  %sub6 = sub nsw i32 %6, %7
  store i32 %sub6, ptr %d, align 4
  %8 = load i32, ptr %t.addr, align 4
  %9 = load i32, ptr %d, align 4
  %10 = load i32, ptr %d, align 4
  %cmp7 = icmp sgt i32 %10, 0
  %conv8 = zext i1 %cmp7 to i32
  %11 = load i32, ptr %d, align 4
  %cmp9 = icmp slt i32 %11, 0
  %conv10 = zext i1 %cmp9 to i32
  %sub11 = sub nsw i32 %conv8, %conv10
  %mul12 = mul nsw i32 %9, %sub11
  %sub13 = sub nsw i32 %8, %mul12
  store i32 %sub13, ptr %r, align 4
  %12 = load i32, ptr %v.addr, align 4
  %cmp14 = icmp slt i32 %12, 0
  br i1 %cmp14, label %cond.true16, label %cond.false18

cond.true16:                                      ; preds = %cond.end
  %13 = load i32, ptr %r, align 4
  %sub17 = sub nsw i32 0, %13
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end
  %14 = load i32, ptr %r, align 4
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true16
  %cond20 = phi i32 [ %sub17, %cond.true16 ], [ %14, %cond.false18 ]
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
