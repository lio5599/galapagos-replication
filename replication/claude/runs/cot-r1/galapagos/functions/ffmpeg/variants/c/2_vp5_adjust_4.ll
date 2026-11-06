; ModuleID = '/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_4.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/ffmpeg/variants/c/2_vp5_adjust_4.c"
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
  %r = alloca i32, align 4
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
  store i32 %cond, ptr %a, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %t.addr, align 4
  %mul = mul nsw i32 2, %4
  %cmp1 = icmp slt i32 %3, %mul
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  %5 = load i32, ptr %a, align 4
  br label %cond.end4

cond.false3:                                      ; preds = %cond.end
  br label %cond.end4

cond.end4:                                        ; preds = %cond.false3, %cond.true2
  %cond5 = phi i32 [ %5, %cond.true2 ], [ 0, %cond.false3 ]
  store i32 %cond5, ptr %c, align 4
  %6 = load i32, ptr %c, align 4
  %7 = load i32, ptr %t.addr, align 4
  %mul6 = mul nsw i32 2, %7
  %8 = load i32, ptr %c, align 4
  %sub7 = sub nsw i32 %mul6, %8
  %cmp8 = icmp slt i32 %6, %sub7
  br i1 %cmp8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %cond.end4
  %9 = load i32, ptr %c, align 4
  br label %cond.end13

cond.false10:                                     ; preds = %cond.end4
  %10 = load i32, ptr %t.addr, align 4
  %mul11 = mul nsw i32 2, %10
  %11 = load i32, ptr %c, align 4
  %sub12 = sub nsw i32 %mul11, %11
  br label %cond.end13

cond.end13:                                       ; preds = %cond.false10, %cond.true9
  %cond14 = phi i32 [ %9, %cond.true9 ], [ %sub12, %cond.false10 ]
  store i32 %cond14, ptr %r, align 4
  %12 = load i32, ptr %v.addr, align 4
  %cmp15 = icmp slt i32 %12, 0
  br i1 %cmp15, label %cond.true16, label %cond.false18

cond.true16:                                      ; preds = %cond.end13
  %13 = load i32, ptr %r, align 4
  %sub17 = sub nsw i32 0, %13
  br label %cond.end19

cond.false18:                                     ; preds = %cond.end13
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
