; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
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
  %term = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %term, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %not = xor i32 %or, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 65
  %and3 = and i32 %and, %sub2
  store i32 %and3, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %4 = load i32, ptr %u, align 4
  %sub4 = sub i32 %4, 97
  %5 = load i32, ptr %u, align 4
  %sub5 = sub i32 122, %5
  %or6 = or i32 %sub4, %sub5
  %not7 = xor i32 %or6, -1
  %shr8 = lshr i32 %not7, 8
  %and9 = and i32 %shr8, 255
  %6 = load i32, ptr %u, align 4
  %sub10 = sub i32 %6, 97
  %add = add i32 %sub10, 26
  %and11 = and i32 %and9, %add
  store i32 %and11, ptr %arrayinit.element, align 4
  %arrayinit.element12 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %7 = load i32, ptr %u, align 4
  %sub13 = sub i32 %7, 48
  %8 = load i32, ptr %u, align 4
  %sub14 = sub i32 57, %8
  %or15 = or i32 %sub13, %sub14
  %not16 = xor i32 %or15, -1
  %shr17 = lshr i32 %not16, 8
  %and18 = and i32 %shr17, 255
  %9 = load i32, ptr %u, align 4
  %sub19 = sub i32 %9, 48
  %add20 = add i32 %sub19, 52
  %and21 = and i32 %and18, %add20
  store i32 %and21, ptr %arrayinit.element12, align 4
  %arrayinit.element22 = getelementptr inbounds i32, ptr %arrayinit.element12, i64 1
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub23 = sub i32 0, %xor
  %not24 = xor i32 %sub23, -1
  %shr25 = lshr i32 %not24, 8
  %and26 = and i32 %shr25, 255
  %and27 = and i32 %and26, 62
  store i32 %and27, ptr %arrayinit.element22, align 4
  %arrayinit.element28 = getelementptr inbounds i32, ptr %arrayinit.element22, i64 1
  %11 = load i32, ptr %u, align 4
  %xor29 = xor i32 %11, 47
  %sub30 = sub i32 0, %xor29
  %not31 = xor i32 %sub30, -1
  %shr32 = lshr i32 %not31, 8
  %and33 = and i32 %shr32, 255
  %and34 = and i32 %and33, 63
  store i32 %and34, ptr %arrayinit.element28, align 4
  %arrayidx = getelementptr inbounds [5 x i32], ptr %term, i64 0, i64 0
  %12 = load i32, ptr %arrayidx, align 16
  store i32 %12, ptr %x, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %13, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i32, ptr %x, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom = zext i32 %15 to i64
  %arrayidx35 = getelementptr inbounds [5 x i32], ptr %term, i64 0, i64 %idxprom
  %16 = load i32, ptr %arrayidx35, align 4
  %xor36 = xor i32 %14, %16
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %i, align 4
  %idxprom37 = zext i32 %18 to i64
  %arrayidx38 = getelementptr inbounds [5 x i32], ptr %term, i64 0, i64 %idxprom37
  %19 = load i32, ptr %arrayidx38, align 4
  %and39 = and i32 %17, %19
  %xor40 = xor i32 %xor36, %and39
  store i32 %xor40, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %20 = load i32, ptr %i, align 4
  %inc = add i32 %20, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %21 = load i32, ptr %x, align 4
  %22 = load i32, ptr %x, align 4
  %sub41 = sub i32 0, %22
  %shr42 = lshr i32 %sub41, 8
  %and43 = and i32 %shr42, 255
  %xor44 = xor i32 255, %and43
  %23 = load i32, ptr %u, align 4
  %xor45 = xor i32 %23, 65
  %sub46 = sub i32 0, %xor45
  %shr47 = lshr i32 %sub46, 8
  %and48 = and i32 %shr47, 255
  %and49 = and i32 %xor44, %and48
  %or50 = or i32 %21, %and49
  ret i32 %or50
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
