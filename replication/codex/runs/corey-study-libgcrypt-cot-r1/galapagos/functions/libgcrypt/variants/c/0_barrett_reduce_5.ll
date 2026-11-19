; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/0_barrett_reduce_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/0_barrett_reduce_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i16 @barrett_reduce(i16 noundef signext %a) #0 {
entry:
  %a.addr = alloca i16, align 2
  %r = alloca i32, align 4
  store i16 %a, ptr %a.addr, align 2
  %0 = load i16, ptr %a.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, ptr %r, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, ptr %r, align 4
  %cmp = icmp sgt i32 %1, 1664
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %r, align 4
  %sub = sub nsw i32 %2, 3329
  store i32 %sub, ptr %r, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  br label %while.cond2

while.cond2:                                      ; preds = %while.body5, %while.end
  %3 = load i32, ptr %r, align 4
  %cmp3 = icmp slt i32 %3, -1664
  br i1 %cmp3, label %while.body5, label %while.end6

while.body5:                                      ; preds = %while.cond2
  %4 = load i32, ptr %r, align 4
  %add = add nsw i32 %4, 3329
  store i32 %add, ptr %r, align 4
  br label %while.cond2, !llvm.loop !8

while.end6:                                       ; preds = %while.cond2
  %5 = load i32, ptr %r, align 4
  %conv7 = trunc i32 %5 to i16
  ret i16 %conv7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call signext i16 @barrett_reduce(i16 noundef signext 0)
  ret i32 0
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
