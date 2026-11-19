; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/1_ctz_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libgcrypt-cot-r1/functions/libgcrypt/variants/c/1_ctz_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @ctz(i64 noundef %in) #0 {
entry:
  %retval = alloca i32, align 4
  %in.addr = alloca i64, align 8
  %r = alloca i32, align 4
  store i64 %in, ptr %in.addr, align 8
  store i32 0, ptr %r, align 4
  %0 = load i64, ptr %in.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 64, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i64, ptr %in.addr, align 8
  %and = and i64 %1, 15
  %cmp1 = icmp eq i64 %and, 0
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %r, align 4
  %add = add nsw i32 %2, 4
  store i32 %add, ptr %r, align 4
  %3 = load i64, ptr %in.addr, align 8
  %shr = lshr i64 %3, 4
  store i64 %shr, ptr %in.addr, align 8
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %4 = load i64, ptr %in.addr, align 8
  %and2 = and i64 %4, 15
  %conv = trunc i64 %and2 to i32
  switch i32 %conv, label %sw.default [
    i32 8, label %sw.bb
    i32 4, label %sw.bb4
    i32 12, label %sw.bb4
    i32 2, label %sw.bb6
    i32 6, label %sw.bb6
    i32 10, label %sw.bb6
    i32 14, label %sw.bb6
  ]

sw.bb:                                            ; preds = %while.end
  %5 = load i32, ptr %r, align 4
  %add3 = add nsw i32 %5, 3
  store i32 %add3, ptr %retval, align 4
  br label %return

sw.bb4:                                           ; preds = %while.end, %while.end
  %6 = load i32, ptr %r, align 4
  %add5 = add nsw i32 %6, 2
  store i32 %add5, ptr %retval, align 4
  br label %return

sw.bb6:                                           ; preds = %while.end, %while.end, %while.end, %while.end
  %7 = load i32, ptr %r, align 4
  %add7 = add nsw i32 %7, 1
  store i32 %add7, ptr %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.end
  %8 = load i32, ptr %r, align 4
  store i32 %8, ptr %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb6, %sw.bb4, %sw.bb, %if.then
  %9 = load i32, ptr %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ctz(i64 noundef 0)
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
