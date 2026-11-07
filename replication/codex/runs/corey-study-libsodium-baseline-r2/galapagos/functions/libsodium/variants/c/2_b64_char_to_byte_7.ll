; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %values = alloca [5 x i32], align 16
  %rejected = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 71
  store i32 %sub1, ptr %arrayinit.element, align 4
  %arrayinit.element2 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %3 = load i32, ptr %u, align 4
  %sub3 = sub i32 %3, -4
  store i32 %sub3, ptr %arrayinit.element2, align 4
  %arrayinit.element4 = getelementptr inbounds i32, ptr %arrayinit.element2, i64 1
  store i32 62, ptr %arrayinit.element4, align 4
  %arrayinit.element5 = getelementptr inbounds i32, ptr %arrayinit.element4, i64 1
  store i32 63, ptr %arrayinit.element5, align 4
  %arrayinit.begin6 = getelementptr inbounds [5 x i32], ptr %rejected, i64 0, i64 0
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 %4, 65
  %5 = load i32, ptr %u, align 4
  %sub8 = sub i32 90, %5
  %or = or i32 %sub7, %sub8
  %shr = lshr i32 %or, 8
  store i32 %shr, ptr %arrayinit.begin6, align 4
  %arrayinit.element9 = getelementptr inbounds i32, ptr %arrayinit.begin6, i64 1
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 97
  %7 = load i32, ptr %u, align 4
  %sub11 = sub i32 122, %7
  %or12 = or i32 %sub10, %sub11
  %shr13 = lshr i32 %or12, 8
  store i32 %shr13, ptr %arrayinit.element9, align 4
  %arrayinit.element14 = getelementptr inbounds i32, ptr %arrayinit.element9, i64 1
  %8 = load i32, ptr %u, align 4
  %sub15 = sub i32 %8, 48
  %9 = load i32, ptr %u, align 4
  %sub16 = sub i32 57, %9
  %or17 = or i32 %sub15, %sub16
  %shr18 = lshr i32 %or17, 8
  store i32 %shr18, ptr %arrayinit.element14, align 4
  %arrayinit.element19 = getelementptr inbounds i32, ptr %arrayinit.element14, i64 1
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub20 = sub i32 0, %xor
  %shr21 = lshr i32 %sub20, 8
  store i32 %shr21, ptr %arrayinit.element19, align 4
  %arrayinit.element22 = getelementptr inbounds i32, ptr %arrayinit.element19, i64 1
  %11 = load i32, ptr %u, align 4
  %xor23 = xor i32 %11, 47
  %sub24 = sub i32 0, %xor23
  %shr25 = lshr i32 %sub24, 8
  store i32 %shr25, ptr %arrayinit.element22, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %12 = load i32, ptr %i, align 4
  %idxprom = zext i32 %12 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom
  %13 = load i32, ptr %arrayidx, align 4
  %and = and i32 %13, 255
  %14 = load i32, ptr %i, align 4
  %idxprom26 = zext i32 %14 to i64
  %arrayidx27 = getelementptr inbounds [5 x i32], ptr %rejected, i64 0, i64 %idxprom26
  %15 = load i32, ptr %arrayidx27, align 4
  %not = xor i32 %15, -1
  %and28 = and i32 %and, %not
  %16 = load i32, ptr %x, align 4
  %or29 = or i32 %16, %and28
  store i32 %or29, ptr %x, align 4
  %17 = load i32, ptr %i, align 4
  %inc = add i32 %17, 1
  store i32 %inc, ptr %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %18 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %18, 5
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !6

do.end:                                           ; preds = %do.cond
  %19 = load i32, ptr %x, align 4
  %tobool = icmp ne i32 %19, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %20 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %do.end
  %21 = load i32, ptr %u, align 4
  %xor30 = xor i32 %21, 65
  %sub31 = sub i32 0, %xor30
  %shr32 = lshr i32 %sub31, 8
  %and33 = and i32 %shr32, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %20, %cond.true ], [ %and33, %cond.false ]
  ret i32 %cond
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
