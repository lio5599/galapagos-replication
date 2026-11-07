; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_6.c"
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
  %reject = alloca [5 x i32], align 16
  %value = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %bit = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %reject, i64 0, i64 0
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  store i32 %shr, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  store i32 %shr5, ptr %arrayinit.element, align 4
  %arrayinit.element6 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %u, align 4
  %sub7 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 57, %6
  %or9 = or i32 %sub7, %sub8
  %shr10 = lshr i32 %or9, 8
  store i32 %shr10, ptr %arrayinit.element6, align 4
  %arrayinit.element11 = getelementptr inbounds i32, ptr %arrayinit.element6, i64 1
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  store i32 %shr13, ptr %arrayinit.element11, align 4
  %arrayinit.element14 = getelementptr inbounds i32, ptr %arrayinit.element11, i64 1
  %8 = load i32, ptr %u, align 4
  %xor15 = xor i32 %8, 47
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  store i32 %shr17, ptr %arrayinit.element14, align 4
  %arrayinit.begin18 = getelementptr inbounds [5 x i32], ptr %value, i64 0, i64 0
  %9 = load i32, ptr %u, align 4
  %sub19 = sub i32 %9, 65
  store i32 %sub19, ptr %arrayinit.begin18, align 4
  %arrayinit.element20 = getelementptr inbounds i32, ptr %arrayinit.begin18, i64 1
  %10 = load i32, ptr %u, align 4
  %sub21 = sub i32 %10, 97
  %add = add i32 %sub21, 26
  store i32 %add, ptr %arrayinit.element20, align 4
  %arrayinit.element22 = getelementptr inbounds i32, ptr %arrayinit.element20, i64 1
  %11 = load i32, ptr %u, align 4
  %sub23 = sub i32 %11, 48
  %add24 = add i32 %sub23, 52
  store i32 %add24, ptr %arrayinit.element22, align 4
  %arrayinit.element25 = getelementptr inbounds i32, ptr %arrayinit.element22, i64 1
  store i32 62, ptr %arrayinit.element25, align 4
  %arrayinit.element26 = getelementptr inbounds i32, ptr %arrayinit.element25, i64 1
  store i32 63, ptr %arrayinit.element26, align 4
  store i32 0, ptr %x, align 4
  store i32 1, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc36, %entry
  %12 = load i32, ptr %bit, align 4
  %cmp = icmp ult i32 %12, 256
  br i1 %cmp, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc, %for.body
  %13 = load i32, ptr %i, align 4
  %cmp28 = icmp ult i32 %13, 5
  br i1 %cmp28, label %for.body29, label %for.end

for.body29:                                       ; preds = %for.cond27
  %14 = load i32, ptr %i, align 4
  %idxprom = zext i32 %14 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %value, i64 0, i64 %idxprom
  %15 = load i32, ptr %arrayidx, align 4
  %16 = load i32, ptr %bit, align 4
  %and = and i32 %15, %16
  %cmp30 = icmp ne i32 %and, 0
  br i1 %cmp30, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body29
  %17 = load i32, ptr %i, align 4
  %idxprom31 = zext i32 %17 to i64
  %arrayidx32 = getelementptr inbounds [5 x i32], ptr %reject, i64 0, i64 %idxprom31
  %18 = load i32, ptr %arrayidx32, align 4
  %19 = load i32, ptr %bit, align 4
  %and33 = and i32 %18, %19
  %cmp34 = icmp eq i32 %and33, 0
  br i1 %cmp34, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32, ptr %bit, align 4
  %21 = load i32, ptr %x, align 4
  %or35 = or i32 %21, %20
  store i32 %or35, ptr %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body29
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %22 = load i32, ptr %i, align 4
  %inc = add i32 %22, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond27, !llvm.loop !6

for.end:                                          ; preds = %for.cond27
  br label %for.inc36

for.inc36:                                        ; preds = %for.end
  %23 = load i32, ptr %bit, align 4
  %shl = shl i32 %23, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !8

for.end37:                                        ; preds = %for.cond
  %24 = load i32, ptr %x, align 4
  %25 = load i32, ptr %x, align 4
  %sub38 = sub i32 0, %25
  %shr39 = lshr i32 %sub38, 8
  %and40 = and i32 %shr39, 255
  %xor41 = xor i32 255, %and40
  %26 = load i32, ptr %u, align 4
  %xor42 = xor i32 %26, 65
  %sub43 = sub i32 0, %xor42
  %shr44 = lshr i32 %sub43, 8
  %and45 = and i32 %shr44, 255
  %and46 = and i32 %xor41, %and45
  %or47 = or i32 %24, %and46
  ret i32 %or47
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
